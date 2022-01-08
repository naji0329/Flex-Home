<template>
    <div class="row">
        <div class="half-circle-spinner" v-if="isLoading">
            <div class="circle circle-1"></div>
            <div class="circle circle-2"></div>
        </div>
        <div class="col-md-3 col-sm-6 container-grid" v-for="item in data" :key="item.id" v-if="!isLoading && data.length">
            <div class="grid-in">
                <div class="grid-shadow">
                    <div class="hourseitem" style="margin-top: 0; ">
                        <div class="blii">
                            <div class="img"><img style="border-radius: 0" class="thumb" :data-src="item.image" :src="item.image" :alt="item.name">
                            </div>
                            <a :href="item.url" class="linkdetail"></a>
                        </div>
                    </div>
                    <div class="grid-h">
                        <div class="blog-title">
                            <a :href="item.url">
                                <h2>{{ item.name }}</h2></a>
                            <div class="post-meta"><p class="d-inline-block">{{ item.created_at }} {{ __('in') }}
                                <a :href="category.url" v-for="category in item.categories">{{ category.name }}</a>&nbsp;
                            </p> - <p class="d-inline-block"><i class   ="fa fa-eye"></i> {{ item.views }}</p></div>
                        </div>
                        <div class="blog-excerpt">
                            <p>{{ item.description }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

    export default {
        data: function() {
            return {
                isLoading: true,
                data: []
            };
        },

        mounted() {
            this.getData();
        },

        props: {
            url: {
                type: String,
                default: () => null,
                required: true
            },
        },

        methods: {
            getData() {
                this.data = [];
                this.isLoading = true;
                axios.get(this.url)
                    .then(res => {
                        this.data = res.data.data ? res.data.data : [];
                        this.isLoading = false;
                    });
            },
        }
    }
</script>
