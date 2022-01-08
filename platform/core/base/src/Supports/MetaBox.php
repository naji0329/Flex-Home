<?php

namespace Botble\Base\Supports;

use Botble\Base\Repositories\Interfaces\MetaBoxInterface;
use Exception;
use Throwable;
use Illuminate\Database\Eloquent\Model;
use Botble\Base\Models\MetaBox as MetaBoxModel;

class MetaBox
{
    /**
     * @var array
     */
    protected $metaBoxes = [];

    /**
     * @var MetaBoxInterface
     */
    protected $metaBoxRepository;

    /**
     * MetaBox constructor.
     * @param MetaBoxInterface $metaBoxRepository
     */
    public function __construct(MetaBoxInterface $metaBoxRepository)
    {
        $this->metaBoxRepository = $metaBoxRepository;
    }

    /**
     * @param string $id
     * @param string $title
     * @param string|array|\Closure $callback
     * @param null $reference
     * @param string $context
     * @param string $priority
     * @param null $callbackArgs
     */
    public function addMetaBox(
        $id,
        $title,
        $callback,
        $reference = null,
        $context = 'advanced',
        $priority = 'default',
        $callbackArgs = null
    ) {
        if (!isset($this->metaBoxes[$reference])) {
            $this->metaBoxes[$reference] = [];
        }
        if (!isset($this->metaBoxes[$reference][$context])) {
            $this->metaBoxes[$reference][$context] = [];
        }

        foreach (array_keys($this->metaBoxes[$reference]) as $a_context) {
            foreach (['high', 'core', 'default', 'low'] as $a_priority) {
                if (!isset($this->metaBoxes[$reference][$a_context][$a_priority][$id])) {
                    continue;
                }

                // If a core box was previously added or removed by a plugin, don't add.
                if ('core' == $priority) {
                    // If core box previously deleted, don't add
                    if (false === $this->metaBoxes[$reference][$a_context][$a_priority][$id]) {
                        return;
                    }

                    /*
                     * If box was added with default priority, give it core priority to
                     * maintain sort order.
                     */
                    if ('default' == $a_priority) {
                        $this->metaBoxes[$reference][$a_context]['core'][$id] = $this->metaBoxes[$reference][$a_context]['default'][$id];
                        unset($this->metaBoxes[$reference][$a_context]['default'][$id]);
                    }
                    return;
                }
                /* If no priority given and id already present, use existing priority.
                 *
                 * Else, if we're adding to the sorted priority, we don't know the title
                 * or callback. Grab them from the previously added context/priority.
                 */
                if (empty($priority)) {
                    $priority = $a_priority;
                } elseif ('sorted' == $priority) {
                    $title = $this->metaBoxes[$reference][$a_context][$a_priority][$id]['title'];
                    $callback = $this->metaBoxes[$reference][$a_context][$a_priority][$id]['callback'];
                    $callbackArgs = $this->metaBoxes[$reference][$a_context][$a_priority][$id]['args'];
                }
                // An id can be in only one priority and one context.
                if ($priority != $a_priority || $context != $a_context) {
                    unset($this->metaBoxes[$reference][$a_context][$a_priority][$id]);
                }
            }
        }

        if (empty($priority)) {
            $priority = 'low';
        }

        if (!isset($this->metaBoxes[$reference][$context][$priority])) {
            $this->metaBoxes[$reference][$context][$priority] = [];
        }

        $this->metaBoxes[$reference][$context][$priority][$id] = [
            'id'       => $id,
            'title'    => $title,
            'callback' => $callback,
            'args'     => $callbackArgs,
        ];
    }

    /**
     * Meta-Box template function
     *
     * @param string $context box context
     * @param mixed $object gets passed to the box callback function as first parameter
     * @return int number of metaBoxes
     *
     * @throws Throwable
     */
    public function doMetaBoxes($context, $object = null)
    {
        $index = 0;
        $data = '';
        $reference = get_class($object);
        if (isset($this->metaBoxes[$reference][$context])) {
            foreach (['high', 'sorted', 'core', 'default', 'low'] as $priority) {
                if (!isset($this->metaBoxes[$reference][$context][$priority])) {
                    continue;
                }

                foreach ((array)$this->metaBoxes[$reference][$context][$priority] as $box) {
                    if (false == $box || !$box['title']) {
                        continue;
                    }
                    $index++;
                    $data .= view('core/base::elements.meta-box-wrap', [
                        'box'      => $box,
                        'callback' => call_user_func_array($box['callback'], [$object, $reference, $box]),
                    ])->render();
                }
            }
        }

        echo view('core/base::elements.meta-box', compact('data', 'context'))->render();

        return $index;
    }

    /**
     * Remove a meta box from an edit form.
     *
     * @param string $id String for use in the 'id' attribute of tags.
     * @param string|object $reference The screen on which to show the box (post, page, link).
     * @param string $context The context within the page where the boxes should show ('normal', 'advanced').
     */
    public function removeMetaBox($id, $reference, $context)
    {
        if (!isset($this->metaBoxes[$reference])) {
            $this->metaBoxes[$reference] = [];
        }

        if (!isset($this->metaBoxes[$reference][$context])) {
            $this->metaBoxes[$reference][$context] = [];
        }

        foreach (['high', 'core', 'default', 'low'] as $priority) {
            $this->metaBoxes[$reference][$context][$priority][$id] = false;
        }
    }

    /**
     * @param Model $object
     * @param string $key
     * @param $value
     * @param $options
     * @return boolean
     * @throws Exception
     */
    public function saveMetaBoxData($object, string $key, $value, $options = null)
    {
        $key = apply_filters('stored_meta_box_key', $key, $object);

        try {
            $fieldMeta = $this->metaBoxRepository->getFirstBy([
                'meta_key'       => $key,
                'reference_id'   => $object->id,
                'reference_type' => get_class($object),
            ]);

            if (!$fieldMeta) {
                $fieldMeta = $this->metaBoxRepository->getModel();
                $fieldMeta->reference_id = $object->id;
                $fieldMeta->meta_key = $key;
                $fieldMeta->reference_type = get_class($object);
            }

            if (!empty($options)) {
                $fieldMeta->options = $options;
            }

            $fieldMeta->meta_value = [$value];
            $this->metaBoxRepository->createOrUpdate($fieldMeta);

            return true;
        } catch (Exception $exception) {
            return false;
        }
    }

    /**
     * @param Model $object
     * @param string $key
     * @param boolean $single
     * @param array $select
     * @return mixed
     */
    public function getMetaData($object, string $key, $single = false, $select = ['meta_value'])
    {
        if ($object instanceof MetaBoxModel) {
            $field = $object;
        } else {
            $field = $this->getMeta($object, $key, $select);
        }

        if (!$field) {
            return $single ? '' : [];
        }

        if ($single) {
            return $field->meta_value[0];
        }

        return $field->meta_value;
    }

    /**
     * @param Model $object
     * @param string $key
     * @param array $select
     * @return mixed
     */
    public function getMeta($object, string $key, $select = ['meta_value'])
    {
        $key = apply_filters('stored_meta_box_key', $key, $object);

        return $this->metaBoxRepository->getFirstBy([
            'meta_key'       => $key,
            'reference_id'   => $object->id,
            'reference_type' => get_class($object),
        ], $select);
    }

    /**
     * @param Model $object
     * @param string $key
     * @return mixed
     * @throws Exception
     */
    public function deleteMetaData($object, string $key)
    {
        $key = apply_filters('stored_meta_box_key', $key, $object);

        return $this->metaBoxRepository->deleteBy([
            'meta_key'       => $key,
            'reference_id'   => $object->id,
            'reference_type' => get_class($object),
        ]);
    }

    /**
     * @return array
     */
    public function getMetaBoxes(): array
    {
        return $this->metaBoxes;
    }
}
