<div class="form-group">
    <label for="select-bathroom" class="control-label">{{ __('Bathrooms') }}</label>
    <div class="select--arrow">
        <select name="bathroom" id="select-bathroom" class="form-control">
            <option value="">{{ __('-- Select --') }}</option>
            @for($i = 1; $i < 5; $i++)
                <option value="{{ $i }}" @if (request()->input('bathroom') == $i) selected @endif>
                    {{ $i }} {{ $i == 1 ? __('room') : __('rooms') }}
                </option>
            @endfor
            <option value="5" @if (request()->input('bathroom') == 5) selected @endif>{{ __('5+ rooms') }}</option>
        </select>
        <i class="fas fa-angle-down"></i>
    </div>
</div>