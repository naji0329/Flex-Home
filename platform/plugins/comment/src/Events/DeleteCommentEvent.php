<?php

namespace Botble\Comment\Events;

use Botble\Comment\Models\Comment;
use Botble\Comment\Models\CommentUser;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class DeleteCommentEvent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    /**
     * @var Comment
     */
    public $comment;

    /**
     * @var CommentUser
     */

    /**
     * Create a new event instance.
     *
     * @param Comment $comment
     * @param CommentUser $commentUser
     */
    public function __construct($comment)
    {
        $this->comment = $comment;
    }

    public function broadcastWith()
    {
        return [
            'id' => $this->comment->id,
            'user' => [
                'name' => $this->comment->user->name,
                'id' => $this->comment->user->id,
            ],
        ];
    }
    
    /**
     * Get the channels the event should broadcast on.
     *
     * @return Channel|array
     */
    public function broadcastOn()
    {
        return new Channel('delete');
    }
}
