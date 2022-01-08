<button class="btn btn-primary my-2" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-response-source" aria-expanded="false" aria-controls="collapse-response-source">
    {{ trans('plugins/payment::payment.view_response_source')}}
</button>
<div class="collapse" id="collapse-response-source">
    <div class="card card-body p-0">
        <code class="p-2">
            <pre>@php print_r($payment); @endphp</pre>
        </code>
    </div>
</div>
