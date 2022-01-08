<?php

namespace Botble\Base\Listeners;

use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Repositories\Interfaces\MetaBoxInterface;
use Exception;

class DeletedContentListener
{

    /**
     * @var MetaBoxInterface
     */
    protected $metaBoxRepository;

    /**
     * DeletedContentListener constructor.
     * @param MetaBoxInterface $metaBoxRepository
     */
    public function __construct(MetaBoxInterface $metaBoxRepository)
    {
        $this->metaBoxRepository = $metaBoxRepository;
    }

    /**
     * Handle the event.
     *
     * @param DeletedContentEvent $event
     * @return void
     */
    public function handle(DeletedContentEvent $event)
    {
        try {
            do_action(BASE_ACTION_AFTER_DELETE_CONTENT, $event->screen, $event->request, $event->data);

            $this->metaBoxRepository->deleteBy([
                'reference_id'   => $event->data->id,
                'reference_type' => get_class($event->data),
            ]);
        } catch (Exception $exception) {
            info($exception->getMessage());
        }
    }
}
