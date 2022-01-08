<div class="form-group">
    <label for="select-category" class="control-label">{{ __('Category') }}</label>
    <div class="select--arrow">
        <select name="category_id" id="select-category" class="form-control">
            <option value="">{{ __('-- Select --') }}</option>
            @foreach($categories as $category)
                <option value="{{ $category->id }}" @if (request()->input('category_id') == $category->id) selected @endif>{{ $category->indent_text . ' ' . $category->name }}</option>
            @endforeach
        </select>
        <i class="fas fa-angle-down"></i>
    </div>
</div>
