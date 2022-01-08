<?php

use Botble\Setting\Facades\SettingFacade;
use Illuminate\Support\Collection;

if (!function_exists('setting')) {
    /**
     * Get the setting instance.
     *
     * @param string|null $key
     * @param string|null $default
     * @return array|\Botble\Setting\Supports\SettingStore|string|null
     */
    function setting($key = null, $default = null)
    {
        if (!empty($key)) {
            try {
                return Setting::get($key, $default);
            } catch (Exception $exception) {
                return $default;
            }
        }

        return SettingFacade::getFacadeRoot();
    }
}

if (!function_exists('get_admin_email')) {
    /**
     * get admin email(s)
     *
     * @return Collection
     */
    function get_admin_email(): Collection
    {
        $email = setting('admin_email');

        if (!$email) {
            return collect([]);
        }

        $email = is_array($email) ? $email : (array)json_decode($email, true);

        return collect(array_filter($email));
    }
}

if (!function_exists('get_setting_email_template_content')) {
    /**
     * Get content of email template if module need to config email template
     * @param string $type type of module is system or plugins
     * @param string $module
     * @param string $templateKey key is config in config.email.templates.$key
     * @return bool|mixed|null
     * @throws \Illuminate\Contracts\Filesystem\FileNotFoundException
     */
    function get_setting_email_template_content($type, $module, $templateKey)
    {
        $defaultPath = platform_path($type . '/' . $module . '/resources/email-templates/' . $templateKey . '.tpl');
        $storagePath = get_setting_email_template_path($module, $templateKey);

        if ($storagePath != null && File::exists($storagePath)) {
            return get_file_data($storagePath, false);
        }

        return File::exists($defaultPath) ? get_file_data($defaultPath, false) : '';
    }
}

if (!function_exists('get_setting_email_template_path')) {
    /**
     * Get user email template path in storage file
     * @param string $module
     * @param string $templateKey key is config in config.email.templates.$key
     * @return string
     */
    function get_setting_email_template_path($module, $templateKey)
    {
        return storage_path('app/email-templates/' . $module . '/' . $templateKey . '.tpl');
    }
}

if (!function_exists('get_setting_email_subject_key')) {
    /**
     * get email subject key for setting() function
     * @param string $module
     * @param string $templateKey
     * @return string
     */
    function get_setting_email_subject_key($type, $module, $templateKey)
    {
        return $type . '_' . $module . '_' . $templateKey . '_subject';
    }
}

if (!function_exists('get_setting_email_subject')) {
    /**
     * Get email template subject value
     * @param string $type : plugins or core
     * @param string $name : name of plugin or core component
     * @param string $templateKey : define in config/email/templates
     * @return array|\Botble\Setting\Supports\SettingStore|null|string
     */
    function get_setting_email_subject($type, $module, $templateKey)
    {
        $subject = setting(get_setting_email_subject_key($type, $module, $templateKey),
            trans(config($type . '.' . $module . '.email.templates.' . $templateKey . '.subject',
                '')));

        return $subject;
    }
}

if (!function_exists('get_setting_email_status_key')) {
    /**
     * Get email on or off status key for setting() function
     * @param string $type
     * @param string $module
     * @param string $templateKey
     * @return string
     */
    function get_setting_email_status_key($type, $module, $templateKey)
    {
        return $type . '_' . $module . '_' . $templateKey . '_' . 'status';
    }
}

if (!function_exists('get_setting_email_status')) {
    /**
     * @param string $type
     * @param string $module
     * @param string $templateKey
     * @return array|\Botble\Setting\Supports\SettingStore|null|string
     */
    function get_setting_email_status($type, $module, $templateKey)
    {
        $default = config($type . '.' . $module . '.email.templates.' . $templateKey . '.enabled', true);

        return setting(get_setting_email_status_key($type, $module, $templateKey), $default);
    }
}
