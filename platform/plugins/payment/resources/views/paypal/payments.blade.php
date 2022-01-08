<ul>
    @foreach($payments->payments as $payment)
        <li>
            @include('plugins/payment::paypal.detail', compact('payment'))
        </li>
    @endforeach
</ul>
