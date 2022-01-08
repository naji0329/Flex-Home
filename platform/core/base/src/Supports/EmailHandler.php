<?php

namespace Botble\Base\Supports;

use Botble\Base\Events\SendMailEvent;
use Botble\Base\Jobs\SendMailJob;
use Botble\Setting\Supports\SettingStore;
use Exception;
use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Illuminate\Support\Arr;
use RvMedia;
use Symfony\Component\ErrorHandler\ErrorRenderer\HtmlErrorRenderer;
use Symfony\Component\ErrorHandler\Exception\FlattenException;
use Throwable;
use URL;

class EmailHandler
{
    /**
     * @var array
     */
    protected $variables = [];

    /**
     * @var array
     */
    protected $variableValues = [];

    /**
     * @var string
     */
    protected $module = 'core';

    /**
     * @var array
     */
    protected $templates = [];

    /**
     * @param string $module
     * @return $this
     */
    public function setModule(string $module): self
    {
        $this->module = $module;
        return $this;
    }

    /**
     * @param string $module
     * @param string $name
     * @param string|null $description
     * @return $this
     */
    public function addVariable(string $name, ?string $description = null, ?string $module = null): self
    {
        if (!$module) {
            $module = $this->module;
        }

        $this->variables[$module][$name] = $description;

        return $this;
    }

    /**
     * @param string|null $module
     * @return array
     */
    public function getVariables(?string $module = null): array
    {
        $this->initVariable();

        if (!$module) {
            return $this->variables;
        }

        return Arr::get($this->variables, $module, []);
    }

    /**
     * @return $this
     */
    public function initVariable(): self
    {
        $this->variables['core'] = [
            'header'           => trans('core/base::base.email_template.header'),
            'footer'           => trans('core/base::base.email_template.footer'),
            'site_title'       => trans('core/base::base.email_template.site_title'),
            'site_url'         => trans('core/base::base.email_template.site_url'),
            'site_logo'        => trans('core/base::base.email_template.site_logo'),
            'date_time'        => trans('core/base::base.email_template.date_time'),
            'date_year'        => trans('core/base::base.email_template.date_year'),
            'site_admin_email' => trans('core/base::base.email_template.site_admin_email'),
        ];

        return $this;
    }

    /**
     * @param string $variable
     * @param string $value
     * @return $this
     */
    public function setVariableValue(string $variable, string $value, string $module = null): self
    {
        $this->variableValues[$module ?: $this->module][$variable] = $value;

        return $this;
    }

    /**
     * @param string|null $module
     * @return array
     */
    public function getVariableValues(?string $module = null)
    {
        if ($module) {
            return Arr::get($this->variableValues, $module, []);
        }

        return $this->variableValues;
    }

    /**
     * @param array $data
     * @param string $module
     * @return $this
     */
    public function setVariableValues(array $data, string $module = null): self
    {
        foreach ($data as $name => $value) {
            $this->variableValues[$module ?: $this->module][$name] = $value;
        }

        return $this;
    }

    /**
     * @param string $module
     * @param array $data
     * @param string $type
     * @return $this
     */
    public function addTemplateSettings(string $module, array $data, string $type = 'plugins'): self
    {
        if (empty($data)) {
            return $this;
        }

        $this->templates = $data['templates'];

        if (Arr::get($data, 'variables')) {
            $this->addVariables($data['variables'], $module);
        }

        add_filter(BASE_FILTER_AFTER_SETTING_EMAIL_CONTENT, function ($html) use ($module, $data, $type) {
            return $html . view('core/setting::template-line', compact('module', 'data', 'type'))->render();
        }, 99);

        return $this;
    }

    /**
     * @param string $module
     * @param array $variables
     * @return $this
     */
    public function addVariables(array $variables, ?string $module = null): self
    {
        if (!$module) {
            $module = $this->module;
        }

        foreach ($variables as $name => $description) {
            $this->variables[$module][$name] = $description;
        }

        return $this;
    }

    /**
     * @param string $template
     * @param string|array $email
     * @param array $args
     * @param bool $debug
     * @param string $type
     * @return bool
     * @throws FileNotFoundException
     * @throws Throwable
     */
    public function sendUsingTemplate(string $template, $email = null, $args = [], $debug = false, $type = 'plugins', $subject = null)
    {
        if (!$this->templateEnabled($template)) {
            return false;
        }

        if (!$subject) {
            $subject = $this->getTemplateSubject($template, $type);
        }

        $this->send($this->getTemplateContent($template, $type), $subject, $email, $args, $debug);

        return true;
    }

    /**
     * @param string $template
     * @param string $type
     * @return array|SettingStore|string|null
     */
    public function templateEnabled(string $template, string $type = 'plugins')
    {
        return get_setting_email_status($type, $this->module, $template);
    }

    /**
     * @param string $content
     * @param string $title
     * @param string $to
     * @param array $args
     * @param bool $debug
     * @throws Throwable
     */
    public function send(string $content, string $title, $to = null, $args = [], $debug = false)
    {
        try {

            if (empty($to)) {
                $to = get_admin_email()->toArray();
                if (empty($to)) {
                    $to = setting('email_from_address', config('mail.from.address'));
                }
            }

            $content = $this->prepareData($content);
            $title = $this->prepareData($title);

            if (setting('using_queue_to_send_mail', config('core.base.general.send_mail_using_job_queue'))) {
                dispatch(new SendMailJob($content, $title, $to, $args, $debug));
            } else {
                event(new SendMailEvent($content, $title, $to, $args, $debug));
            }
        } catch (Exception $exception) {
            if ($debug) {
                throw $exception;
            }
            info($exception->getMessage());
            $this->sendErrorException($exception);
        }
    }

    /**
     * @param string $content
     * @param array $variables
     * @return string
     * @throws FileNotFoundException
     */
    public function prepareData(string $content, $variables = []): string
    {
        $this->initVariable();
        $this->initVariableValues();

        if (!empty($content)) {
            $content = $this->replaceVariableValue(array_keys($this->variables['core']), 'core', $content);

            if ($this->module !== 'core') {
                if (empty($variables)) {
                    $variables = Arr::get($this->variables, $this->module, []);
                }

                $content = $this->replaceVariableValue(
                    array_keys($variables),
                    $this->module,
                    $content
                );
            }
        }

        return apply_filters(BASE_FILTER_EMAIL_TEMPLATE, $content);
    }

    /**
     * @throws FileNotFoundException
     */
    public function initVariableValues()
    {
        $this->variableValues['core'] = [
            'header'           => apply_filters(BASE_FILTER_EMAIL_TEMPLATE_HEADER,
                get_setting_email_template_content('core', 'base', 'header')),
            'footer'           => apply_filters(BASE_FILTER_EMAIL_TEMPLATE_FOOTER,
                get_setting_email_template_content('core', 'base', 'footer')),
            'site_title'       => setting('admin_title') ?: config('app.name'),
            'site_url'         => url(''),
            'site_logo'        => setting('admin_logo') ? RvMedia::getImageUrl(setting('admin_logo')) : url(config('core.base.general.logo')),
            'date_time'        => now()->toDateTimeString(),
            'date_year'        => now()->format('Y'),
            'site_admin_email' => get_admin_email()->first(),
        ];
    }

    /**
     * @param array $variables
     * @param string $module
     * @param string $content
     * @return string
     */
    protected function replaceVariableValue(array $variables, string $module, string $content): string
    {
        do_action('email_variable_value');

        foreach ($variables as $variable) {
            $keys = [
                '{{ ' . $variable . ' }}',
                '{{' . $variable . '}}',
                '{{ ' . $variable . '}}',
                '{{' . $variable . ' }}',
                '<?php echo e(' . $variable . '); ?>',
            ];

            foreach ($keys as $key) {
                $content = str_replace($key, $this->getVariableValue($variable, $module), $content);
            }
        }

        return $content;
    }

    /**
     * @param string $variable
     * @param string $module
     * @param string $default
     * @return string
     */
    public function getVariableValue(string $variable, string $module, string $default = ''): string
    {
        return (string)Arr::get($this->variableValues, $module . '.' . $variable, $default);
    }

    /**
     * Sends an email to the developer about the exception.
     *
     * @param Exception|Throwable $exception
     * @return void
     *
     * @throws Throwable
     */
    public function sendErrorException(Exception $exception)
    {
        try {
            $ex = FlattenException::create($exception);

            $url = URL::full();
            $error = $this->renderException($exception);

            $this->send(
                view('core/base::emails.error-reporting', compact('url', 'ex', 'error'))->render(),
                $exception->getFile(),
                !empty(config('core.base.general.error_reporting.to')) ?
                    config('core.base.general.error_reporting.to') :
                    get_admin_email()->toArray()
            );
        } catch (Exception $ex) {
            info($ex->getMessage());
        }
    }

    /**
     * @param Throwable $exception
     * @return string
     */
    protected function renderException($exception)
    {
        $renderer = new HtmlErrorRenderer(true);

        $exception = $renderer->render($exception);

        if (!headers_sent()) {
            http_response_code($exception->getStatusCode());

            foreach ($exception->getHeaders() as $name => $value) {
                header($name . ': ' . $value, false);
            }
        }

        return $exception->getAsString();
    }

    /**
     * @param string $template
     * @param string $type
     * @return string|null
     * @throws FileNotFoundException
     */
    public function getTemplateContent(string $template, string $type = 'plugins'): ?string
    {
        return get_setting_email_template_content($type, $this->module, $template);
    }

    /**
     * @param string $template
     * @param string $type
     * @return array|SettingStore|string|null
     */
    public function getTemplateSubject(string $template, string $type = 'plugins')
    {
        return get_setting_email_subject($type, $this->module, $template);
    }
}
