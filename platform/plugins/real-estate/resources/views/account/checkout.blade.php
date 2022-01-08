@extends('plugins/real-estate::account.layouts.skeleton')
@section('content')
    <div class="settings">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xs-12">
                    {!! do_shortcode('[payment-form currency="' . ($package->currency->title ? strtoupper($package->currency->title) : cms_currency()->getDefaultCurrency()->title) . '" amount="' . $package->price . '" name="' . $package->name . '" return_url="' . route('public.account.packages') . '" callback_url="' . route('public.account.package.subscribe.callback', $package->id) . '"][/payment-form]') !!}
                </div>
            </div>
        </div>
    </div>
@stop
