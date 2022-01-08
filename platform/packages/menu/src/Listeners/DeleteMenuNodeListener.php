<?php

namespace Botble\Menu\Listeners;

use Botble\Base\Events\DeletedContentEvent;
use Botble\Menu\Repositories\Interfaces\MenuNodeInterface;
use Exception;
use Menu;

class DeleteMenuNodeListener
{

    /**
     * @var MenuNodeInterface
     */
    protected $menuNodeRepository;

    /**
     * DeletedContentListener constructor.
     * @param MenuNodeInterface $menuNodeRepository
     */
    public function __construct(MenuNodeInterface $menuNodeRepository)
    {
        $this->menuNodeRepository = $menuNodeRepository;
    }

    /**
     * Handle the event.
     *
     * @param DeletedContentEvent $event
     * @return void
     */
    public function handle(DeletedContentEvent $event)
    {
        if (in_array(get_class($event->data), Menu::getMenuOptionModels())) {
            try {
                $this->menuNodeRepository->deleteBy([
                    'reference_id'   => $event->data->id,
                    'reference_type' => get_class($event->data),
                ]);
            } catch (Exception $exception) {
                info($exception->getMessage());
            }
        }
    }
}
