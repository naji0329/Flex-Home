@push('header')
    <script>
        window.trans = JSON.parse('{!! addslashes(json_encode(trans('plugins/real-estate::dashboard'))) !!}');
    </script>
@endpush

<div id="app-real-estate">
    <facilities-component :selected_facilities="{{ json_encode($selectedFacilities) }}" :facilities="{{ json_encode($facilities) }}"></facilities-component>
</div>
