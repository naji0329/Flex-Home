<?php

namespace Botble\Slug\Listeners;

use Botble\Base\Events\UpdatedContentEvent;
use Botble\Slug\Events\UpdatedSlugEvent;
use Botble\Slug\Repositories\Interfaces\SlugInterface;
use Botble\Slug\Services\SlugService;
use Exception;
use Illuminate\Support\Str;
use SlugHelper;

class UpdatedContentListener
{

    /**
     * @var SlugInterface
     */
    protected $slugRepository;

    /**
     * UpdatedContentListener constructor.
     * @param SlugInterface $slugRepository
     */
    public function __construct(SlugInterface $slugRepository)
    {
        $this->slugRepository = $slugRepository;
    }

    /**
     * Handle the event.
     *
     * @param UpdatedContentEvent $event
     * @return void
     */
    public function handle(UpdatedContentEvent $event)
    {
        if (SlugHelper::isSupportedModel(get_class($event->data)) && $event->request->input('is_slug_editable', 0)) {
            try {
                $slug = $event->request->input('slug');

                if (!$slug) {
                    $slug = $event->request->input('name');
                }

                if (!$slug && $event->data->name) {
                    if (!SlugHelper::turnOffAutomaticUrlTranslationIntoLatin()) {
                        $slug = Str::slug($event->data->name);
                    } else {
                        $slug = $event->data->name;
                    }
                }

                if (!$slug) {
                    $slug = time();
                }

                $item = $this->slugRepository->getFirstBy([
                    'reference_type' => get_class($event->data),
                    'reference_id'   => $event->data->id,
                ]);

                if ($item) {
                    if ($item->key != $slug) {
                        $slugService = new SlugService(app(SlugInterface::class));
                        $item->key = $slugService->create($slug, (int)$event->data->slug_id);
                        $item->prefix = SlugHelper::getPrefix(get_class($event->data));
                        $this->slugRepository->createOrUpdate($item);
                    }
                } else {
                    $item = $this->slugRepository->createOrUpdate([
                        'key'            => $slug,
                        'reference_type' => get_class($event->data),
                        'reference_id'   => $event->data->id,
                        'prefix'         => SlugHelper::getPrefix(get_class($event->data)),
                    ]);
                }

                event(new UpdatedSlugEvent($event->data, $item));
            } catch (Exception $exception) {
                info($exception->getMessage());
            }
        }
    }
}
