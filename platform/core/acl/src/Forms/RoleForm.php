<?php

namespace Botble\ACL\Forms;

use Assets;
use Botble\ACL\Http\Requests\RoleCreateRequest;
use Botble\ACL\Models\Role;
use Botble\Base\Forms\FormAbstract;
use Illuminate\Support\Arr;

class RoleForm extends FormAbstract
{

    /**
     * {@inheritDoc}
     */
    public function buildForm()
    {
        Assets::addStyles(['jquery-ui', 'jqueryTree'])
            ->addScripts(['jquery-ui', 'jqueryTree'])
            ->addScriptsDirectly('vendor/core/core/acl/js/role.js');

        $flags = $this->getAvailablePermissions();
        $children = $this->getPermissionTree($flags);
        $active = [];

        if ($this->getModel()) {
            $active = array_keys($this->getModel()->permissions);
        }

        $this
            ->setupModel(new Role)
            ->setValidatorClass(RoleCreateRequest::class)
            ->withCustomFields()
            ->add('name', 'text', [
                'label'      => trans('core/base::forms.name'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => trans('core/base::forms.name_placeholder'),
                    'data-counter' => 120,
                ],
            ])
            ->add('description', 'textarea', [
                'label'      => trans('core/base::forms.description'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'rows'         => 4,
                    'placeholder'  => trans('core/base::forms.description_placeholder'),
                    'data-counter' => 400,
                ],
            ])
            ->add('is_default', 'onOff', [
                'label'      => trans('core/base::forms.is_default'),
                'label_attr'    => ['class' => 'control-label'],
                'default_value' => false,
            ])
            ->addMetaBoxes([
                'permissions' => [
                    'title'   => trans('core/acl::permissions.permission_flags'),
                    'content' => view('core/acl::roles.permissions', compact('active', 'flags', 'children'))->render(),
                ],
            ])
            ->setActionButtons(view('core/acl::roles.actions', ['role' => $this->getModel()])->render());
    }

    /**
     * @return array
     */
    protected function getAvailablePermissions(): array
    {
        $permissions = [];

        $configuration = config(strtolower('cms-permissions'));
        if (!empty($configuration)) {
            foreach ($configuration as $config) {
                $permissions[$config['flag']] = $config;
            }
        }

        $types = ['core', 'packages', 'plugins'];

        foreach ($types as $type) {
            $permissions = array_merge($permissions, $this->getAvailablePermissionForEachType($type));
        }

        return $permissions;
    }

    /**
     * @param string $type
     * @return array
     */
    protected function getAvailablePermissionForEachType($type)
    {
        $permissions = [];

        foreach (scan_folder(platform_path($type)) as $module) {
            $configuration = config(strtolower($type . '.' . $module . '.permissions'));
            if (!empty($configuration)) {
                foreach ($configuration as $config) {
                    $permissions[$config['flag']] = $config;
                }
            }
        }

        return $permissions;
    }

    /**
     * @param array $permissions
     * @return array
     */
    protected function getPermissionTree($permissions): array
    {
        $sortedFlag = $permissions;
        sort($sortedFlag);
        $children['root'] = $this->getChildren('root', $sortedFlag);

        foreach (array_keys($permissions) as $key) {
            $childrenReturned = $this->getChildren($key, $permissions);
            if (count($childrenReturned) > 0) {
                $children[$key] = $childrenReturned;
            }
        }

        return $children;
    }

    /**
     * @param int $parentId
     * @param array $allFlags
     * @return mixed
     */
    protected function getChildren($parentId, array $allFlags)
    {
        $newFlagArray = [];
        foreach ($allFlags as $flagDetails) {
            if (Arr::get($flagDetails, 'parent_flag', 'root') == $parentId) {
                $newFlagArray[] = $flagDetails['flag'];
            }
        }
        return $newFlagArray;
    }
}
