<div class="form-group">
    <label for="select-blocks" class="control-label">{{ __('Number of blocks') }}</label>
    <div class="select--arrow">
        <select name="blocks" id="select-blocks" class="form-control">
            <option value="">{{ __('-- Select --') }}</option>
            @for($i = 1; $i < 5; $i++)
                <option value="{{ $i }}" @if (request()->input('blocks') == $i) selected @endif>{{ $i }} {{ $i == 1 ? __('block') : __('blocks') }}</option>
            @endfor
            <option value="5" @if (request()->input('blocks') == 5) selected @endif>{{ __('5+ blocks') }}</option>
        </select>
        <i class="fas fa-angle-down"></i>
    </div>
</div>