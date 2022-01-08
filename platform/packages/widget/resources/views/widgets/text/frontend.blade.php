<div class="panel panel-default">
    <div class="panel-title">
        <h3>{{ $config['name'] }}</h3>
    </div>
    <div class="panel-content">
        <p>{!! app('shortcode')->compile(clean($config['content'])) !!}</p>
    </div>
</div>
