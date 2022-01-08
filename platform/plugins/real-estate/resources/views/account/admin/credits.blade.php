<div id="credit-histories">
    <br>
    <h4>{{ __('Credits') }}: {{ $account->credits }}</h4>

    <div class="mt20 mb20">
        <div>
            <div class="comment-log ws-nm">
                <div class="comment-log-title">
                    <div class="row">
                        <div class="col-md-6">
                            <label class="bold-light m-xs-b hide-print">{{ __('Transactions') }}</label>
                        </div>
                        <div class="col-md-6 text-end">
                            <a href="#" class="btn-trigger-add-credit">{{ __('Manual Transaction') }}</a>
                        </div>
                    </div>
                </div>
                <div class="comment-log-timeline">
                    @if ($transactions->count() > 0)
                        <div class="column-left-history ps-relative" id="order-history-wrapper">
                            <div class="item-card">
                                <div class="item-card-body clearfix">
                                    @foreach ($transactions as $transaction)
                                        <div class="item comment-log-item comment-log-item-date ui-feed__timeline">
                                            <div class="ui-feed__item ui-feed__item--message">
                                                <span class="ui-feed__marker @if ($transaction->account_id) ui-feed__marker--user-action @endif"></span>
                                                <div class="ui-feed__message">
                                                    <div class="timeline__message-container">
                                                        <div class="timeline__inner-message">
                                                            <a href="#"
                                                               class="text-no-bold show-timeline-dropdown hover-underline"
                                                               data-bs-target="#history-line-{{ $transaction->id }}">
                                                                {!! clean($transaction->getDescription()) !!}
                                                            </a>
                                                        </div>
                                                        <time class="timeline__time">
                                                            <span>{{ $transaction->created_at }}</span></time>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="timeline-dropdown" id="history-line-{{ $transaction->id }}">
                                                {{ $transaction->description }}
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    @else
                        <p>{{ __('No transactions!') }}</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
