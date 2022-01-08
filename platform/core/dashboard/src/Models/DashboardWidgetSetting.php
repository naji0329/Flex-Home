<?php

namespace Botble\Dashboard\Models;

use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DashboardWidgetSetting extends BaseModel
{
    /**
     * @var string
     */
    protected $table = 'dashboard_widget_settings';

    /**
     * @var array
     */
    protected $dates = [
        'created_at',
        'updated_at',
    ];

    /**
     * @var array
     */
    protected $fillable = [
        'settings',
        'widget_id',
        'user_id',
        'order',
        'status',
    ];

    /**
     * @var array
     */
    protected $casts = [
        'settings' => 'json',
    ];

    /**
     * @return BelongsTo
     */
    public function widget()
    {
        return $this->belongsTo(DashboardWidget::class);
    }
}
