<?php

use Botble\Language\Models\LanguageMeta;
use Botble\Page\Models\Page;
use Botble\Slug\Models\Slug;
use Illuminate\Database\Migrations\Migration;

class ChangeContactPageToAPage extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        $data = [
            'en_US' => [
                [
                    'name'     => 'Contact',
                    'content'  => Html::tag('p',
                        '[contact-form][/contact-form]<br><br><h3>Directions</h3>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]'),
                    'template' => 'default',
                    'user_id'  => 1,
                ],
                [
                    'name'     => 'Cookie Policy',
                    'content'  => Html::tag('h3', 'EU Cookie Consent') .
                        Html::tag('p', 'To use this Website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.') .
                        Html::tag('h4', 'Essential Data') .
                        Html::tag('p', 'The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.') .
                        Html::tag('p', '- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.') .
                        Html::tag('p', '- XSRF-Token Cookie: Laravel automatically generates a CSRF "token" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.'),
                    'template' => 'default',
                    'user_id'  => 1,
                ],
            ],
            'vi'    => [
                [
                    'name'     => 'Liên hệ',
                    'content'  => Html::tag('p',
                        '[contact-form][/contact-form]<br><br><h3>Tìm đường đi</h3>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]'),
                    'template' => 'default',
                    'user_id'  => 1,
                ],
                [
                    'name'     => 'Cookie Policy',
                    'content'  => Html::tag('h3', 'EU Cookie Consent') .
                        Html::tag('p', 'Để sử dụng Trang web này, chúng tôi đang sử dụng Cookie và thu thập một số Dữ liệu. Để tuân thủ GDPR của Liên minh Châu Âu, chúng tôi cho bạn lựa chọn nếu bạn cho phép chúng tôi sử dụng một số Cookie nhất định và thu thập một số Dữ liệu.') .
                        Html::tag('h4', 'Dữ liệu cần thiết') .
                        Html::tag('p', 'Dữ liệu cần thiết là cần thiết để chạy Trang web bạn đang truy cập về mặt kỹ thuật. Bạn không thể hủy kích hoạt chúng.') .
                        Html::tag('p', '- Session Cookie: PHP sử dụng Cookie để xác định phiên của người dùng. Nếu không có Cookie này, trang web sẽ không hoạt động.') .
                        Html::tag('p', '- XSRF-Token Cookie: Laravel tự động tạo "token" CSRF cho mỗi phiên người dùng đang hoạt động do ứng dụng quản lý. Token này được sử dụng để xác minh rằng người dùng đã xác thực là người thực sự đưa ra yêu cầu đối với ứng dụng.'),
                    'template' => 'default',
                    'user_id'  => 1,
                ],
            ],
        ];

        Page::whereIn('name', ['Contact', 'Liên hệ'])->delete();
        Slug::whereIn('key', ['contact', 'lien-he'])->delete();

        foreach ($data as $locale => $pages) {
            foreach ($pages as $index => $item) {
                $page = Page::create($item);

                Slug::create([
                    'reference_type' => Page::class,
                    'reference_id'   => $page->id,
                    'key'            => Str::slug($page->name),
                    'prefix'         => SlugHelper::getPrefix(Page::class),
                ]);

                $originValue = md5($page->id . Page::class . time());

                $languageMeta = LanguageMeta::where([
                    'reference_id'   => $index + 1,
                    'reference_type' => Page::class,
                ])->first();

                if ($languageMeta) {
                    $originValue = $languageMeta->lang_meta_origin;
                }

                LanguageMeta::insert([
                    'reference_id'     => $page->id,
                    'reference_type'   => Page::class,
                    'lang_meta_code'   => $locale,
                    'lang_meta_origin' => $originValue,
                ]);
            }
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Page::whereIn('name', ['Contact', 'Liên hệ'])->delete();
        Slug::whereIn('key', ['contact', 'lien-he'])->delete();
    }
}
