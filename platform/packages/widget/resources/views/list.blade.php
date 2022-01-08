@extends(BaseHelper::getAdminMasterLayoutTemplate())
@section('content')
    @php do_action(BASE_ACTION_TOP_FORM_CONTENT_NOTIFICATION, request(), WIDGET_MANAGER_MODULE_SCREEN_NAME) @endphp
    <div class="widget-main" id="wrap-widgets">
        <div class="row">
            <div class="col-sm-6">
                <h2>{{ trans('packages/widget::widget.available') }}</h2>
                <p>{{ trans('packages/widget::widget.instruction') }}</p>
                <ul id="wrap-widget-1">
                    @foreach (Widget::getWidgets() as $widget)
                        <li data-id="{{ $widget->getId() }}">
                            <div class="widget-handle">
                                <p class="widget-name">{{ $widget->getConfig()['name'] }} <span class="text-end"><i class="fa fa-caret-up"></i></span>
                                </p>
                            </div>
                            <div class="widget-content">
                                <form method="post">
                                    <input type="hidden" name="id" value="{{ $widget->getId() }}">
                                    {!! $widget->form() !!}
                                    <div class="widget-control-actions">
                                        <div class="float-start">
                                            <button class="btn btn-danger widget-control-delete">{{ trans('packages/widget::widget.delete') }}</button>
                                        </div>
                                        <div class="float-end text-end">
                                            <button class="btn btn-primary widget_save">{{ trans('core/base::forms.save') }}</button>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </form>
                            </div>
                            <div class="widget-description">
                                <p>{{ $widget->getConfig()['description'] }}</p>
                            </div>
                        </li>
                    @endforeach
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="col-sm-6" id="added-widget">
                {!! apply_filters(WIDGET_TOP_META_BOXES, null, WIDGET_MANAGER_MODULE_SCREEN_NAME) !!}
                <div class="row">
                    @foreach (WidgetGroup::getGroups() as $group)
                        <div class="col-sm-6 sidebar-item" data-id="{{ $group->getId() }}">
                            <div class="sidebar-area">
                                <div class="sidebar-header">
                                    <h3>{{ $group->getName() }}</h3>
                                    <p>{{ $group->getDescription() }}</p>
                                </div>
                                <ul id="wrap-widget-{{ ($loop->index + 2) }}">
                                    @include('packages/widget::item', ['widgetAreas' => $group->getWidgets()])
                                    <div class="clearfix"></div>
                                </ul>
                            </div>
                        </div>
                        @if ($loop->index % 2 != 0)
                            <div class="clearfix"></div>
                        @endif
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@stop

@push('footer')
    <script>
        'use strict';
        var BWidget = BWidget || {};
        BWidget.routes = {
            'delete': '{{ route('widgets.destroy', ['ref_lang' => request()->input('ref_lang')]) }}',
            'save_widgets_sidebar': '{{ route('widgets.save_widgets_sidebar', ['ref_lang' => request()->input('ref_lang')]) }}'
        };
    </script>
@endpush
