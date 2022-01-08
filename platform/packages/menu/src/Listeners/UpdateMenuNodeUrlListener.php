<?php

namespace Botble\Menu\Listeners;

use Botble\Menu\Repositories\Interfaces\MenuNodeInterface;
use Botble\Slug\Events\UpdatedSlugEvent;
use Exception;
use Menu;

class UpdateMenuNodeUrlListener
{

    /**
     * @var MenuNodeInterface
     */
    protected $menuNodeRepository;

    /**
     * UpdateMenuNodeUrlListener constructor.
     * @param MenuNodeInterface $menuNodeRepository
     */
    public function __construct(MenuNodeInterface $menuNodeRepository)
    {
        $this->menuNodeRepository = $menuNodeRepository;
    }

    /**
     * Handle the event.
     *
     * @param UpdatedSlugEvent $event
     * @return void
     */
    public function handle(UpdatedSlugEvent $event)
    {
        try {
            if (in_array(get_class($event->data), Menu::getMenuOptionModels())) {
                $nodes = $this->menuNodeRepository->allBy([
                    'reference_id'   => $event->data->id,
                    'reference_type' => get_class($event->data),
                ]);

                foreach ($nodes as $node) {
                    $newUrl = str_replace(url(''), '', $node->reference->url);
                    if ($node->url != $newUrl) {
                        $node->url = $newUrl;
                        $node->save();
                    }
                }
            }
        } catch (Exception $exception) {
            info($exception->getMessage());
        }
    }
}
