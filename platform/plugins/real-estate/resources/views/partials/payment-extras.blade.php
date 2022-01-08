<p><strong><a href="{{ route('package.edit', $package->id) }}" target="_blank">{{ $package->name }}</a></strong></p>

@if ((float)$package->price)
    <p><strong>{{ format_price($package->price / $package->number_of_listings, $package->currency) }}</strong> / {{ __('per post') }}</p>
    <p><strong>{{ format_price($package->price, $package->currency) }}</strong> {{ __('total') }} ({{ __('save')}} {{ $package->percent_save }}%)</p>
@else
    <p><strong>{{ __('free') }}</strong> {{ $package->number_of_listings }} {{ __('posts') }}</p>
@endif
