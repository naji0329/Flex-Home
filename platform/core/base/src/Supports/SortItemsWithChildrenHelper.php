<?php

namespace Botble\Base\Supports;

use Exception;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;

class SortItemsWithChildrenHelper
{
    /**
     * @var Collection
     */
    protected $items;

    /**
     * @var string
     */
    protected $parentField = 'parent_id';

    /**
     * @var string
     */
    protected $compareKey = 'id';

    /**
     * @var string
     */
    protected $childrenProperty = 'children_items';

    /**
     * @var array
     */
    protected $result = [];

    /**
     * @param array|Collection $items
     * @return $this
     * @throws Exception
     */
    public function setItems($items)
    {
        if (is_array($items)) {
            $this->items = collect($items);
            return $this;
        } elseif ($items instanceof Collection) {
            $this->items = $items;
            return $this;
        }

        throw new Exception('Items must be array or collection');
    }

    /**
     * @param string $string
     * @return $this
     */
    public function setParentField(string $string): self
    {
        $this->parentField = $string;

        return $this;
    }

    /**
     * @param string $key
     * @return $this
     */
    public function setCompareKey(string $key): self
    {
        $this->compareKey = $key;

        return $this;
    }

    /**
     * @param string $string
     * @return $this
     */
    public function setChildrenProperty(string $string): self
    {
        $this->childrenProperty = $string;

        return $this;
    }

    /**
     * @return array
     */
    public function sort(): array
    {
        return $this->processSort();
    }

    /**
     * @param int $parentId
     * @return array
     */
    protected function processSort(int $parentId = 0): array
    {
        $result = [];
        $filtered = $this->items->where($this->parentField, $parentId);
        foreach ($filtered as $item) {
            if (is_object($item)) {
                $item->{$this->childrenProperty} = $this->processSort($item->{$this->compareKey});
            } else {
                $item[$this->childrenProperty] = $this->processSort(Arr::get($item, $this->compareKey));
            }
            $result[] = $item;
        }

        return $result;
    }
}
