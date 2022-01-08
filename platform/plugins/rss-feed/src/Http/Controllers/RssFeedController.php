<?php

namespace Botble\RssFeed\Http\Controllers;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Blog\Repositories\Interfaces\PostInterface;
use Botble\Theme\Http\Controllers\PublicController;
use File;
use Mimey\MimeTypes;
use RssFeed;
use RvMedia;
use Spatie\Feed\Feed;
use Spatie\Feed\FeedItem;

class RssFeedController extends PublicController
{
    /**
     * @param PostInterface $postRepository
     * @return Feed
     */
    public function getPostFeeds(PostInterface $postRepository)
    {
        if (!is_plugin_active('blog')) {
            abort(404);
        }

        $data = $postRepository->advancedGet([
            'condition' => ['status' => BaseStatusEnum::PUBLISHED],
            'order_by'  => ['created_at' => 'desc'],
            'take'      => 20,
        ]);

        $feedItems = collect([]);

        foreach ($data as $item) {
            $imageURL = RvMedia::getImageUrl($item->image, null, false, RvMedia::getDefaultImage());

            $feedItems[] = FeedItem::create()
                ->id($item->id)
                ->title(clean($item->name))
                ->summary(clean($item->description))
                ->updated($item->updated_at)
                ->enclosure($imageURL)
                ->enclosureType((new MimeTypes)->getMimeType(File::extension($imageURL)))
                ->enclosureLength(RssFeed::remoteFilesize($imageURL))
                ->category($item->categories()->value('name'))
                ->link((string)$item->url)
                ->author($item->author_id ? $item->author->name : '');
        }

        return RssFeed::renderFeedItems($feedItems, 'Posts feed', 'Latest posts from ' . theme_option('site_title'));
    }
}
