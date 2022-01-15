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

class NewLikeEvent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    /**
     * @var Comment
     */
    public $liked;
    public $commentId;
    public $likeCount;
    /**
     * @var CommentUser
     */

    /**
     * Create a new event instance.
     *
     * @param Comment $commentId
     * @param CommentUser $likeCount
     */
    public function __construct($liked, $commentId, $likeCount)
    {
        $this->liked = $liked;
        $this->commentId = $commentId;
        $this->likeCount = $likeCount;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return Channel|array
     */
    public function broadcastOn()
    {
        return new Channel('like');
    }
}
