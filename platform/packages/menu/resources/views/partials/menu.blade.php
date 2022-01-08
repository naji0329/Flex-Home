<ol class="dd-list">
    @foreach ($menu_nodes as $key => $row)
        <li class="dd-item dd3-item @if ($row->reference_id > 0) post-item @endif" data-reference-type="{{ $row->reference_type }}"
            data-reference-id="{{ $row->reference_id }}" data-title="{{ $row->title }}"
            data-class="{{ $row->css_class }}" data-id="{{ $row->id }}" data-custom-url="{{ $row->url }}"
            data-icon-font="{{ $row->icon_font }}" data-target="{{ $row->target }}">
            <div class="dd-handle dd3-handle"></div>
            <div class="dd3-content">
                <span class="text float-start" data-update="title">{{ $row->title }}</span>
                <span class="text float-end">{{ Arr::last(explode('\\', $row->reference_type)) ?: trans('packages/menu::menu.custom_link') }}</span>
                <a href="#" title="" class="show-item-details"><i class="fa fa-angle-down"></i></a>
                <div class="clearfix"></div>
            </div>
            <div class="item-details">
                <label class="pb-3">
                    <span class="text" data-update="title">{{ trans('packages/menu::menu.title') }}</span>
                    <input type="text" name="title" value="{{ $row->title }}"
                           data-old="{{ $row->title }}">
                </label>
                @if (!$row->reference_id)
                    <label class="pb-3">
                        <span class="text" data-update="custom-url">{{ trans('packages/menu::menu.url') }}</span>
                        <input type="text" name="custom-url" value="{{ $row->url }}" data-old="{{ $row->url }}">
                    </label>
                @endif
                <label class="pb-3">
                    <span class="text" data-update="icon-font">{{ trans('packages/menu::menu.icon') }}</span>
                    <input type="text" name="icon-font" value="{{ $row->icon_font }}" data-old="{{ $row->icon_font }}">
                </label>
                <label class="pb-3">
                    <span class="text">{{ trans('packages/menu::menu.css_class') }}</span>
                    <input type="text" name="class" value="{{ $row->css_class }}" data-old="{{ $row->css_class }}">
                </label>
                <label class="pb-3">
                    <span class="text">{{ trans('packages/menu::menu.target') }}</span>
                    <div style="width: 228px; display: inline-block">
                        <div class="ui-select-wrapper">
                            <select name="target" class="ui-select" id="target" data-old="{{ $row->target }}">
                                <option value="_self" @if ($row->target == '_self') selected="selected" @endif>{{ trans('packages/menu::menu.self_open_link') }}
                                </option>
                                <option value="_blank" @if ($row->target == '_blank') selected="selected" @endif>{{ trans('packages/menu::menu.blank_open_link') }}
                                </option>
                            </select>
                            <svg class="svg-next-icon svg-next-icon-size-16">
                                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
                            </svg>
                        </div>
                    </div>
                </label>
                <div class="clearfix"></div>
                <div class="text-end" style="margin-top: 5px">
                    <a href="#" class="btn btn-danger btn-remove btn-sm">{{ trans('packages/menu::menu.remove') }}</a>
                    <a href="#" class="btn btn-primary btn-cancel btn-sm">{{ trans('packages/menu::menu.cancel') }}</a>
                </div>
            </div>
            <div class="clearfix"></div>
            @if ($row->has_child)
                {!!
                    Menu::generateMenu([
                        'menu'       => $menu,
                        'menu_nodes' => $row->child,
                        'view'      => 'packages/menu::partials.menu',
                        'theme'     => false,
                        'active'    => false
                    ])
                !!}
            @endif
        </li>
    @endforeach
</ol>
