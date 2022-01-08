<template>
    <div class="row rowm10 list-agency">
        <div class="half-circle-spinner" v-if="isLoading">
            <div class="circle circle-1"></div>
            <div class="circle circle-2"></div>
        </div>
        <template v-for="item in data">
            <div class="col-lg-3 col-md-4 col-sm-6" v-html="item.HTML" :key="item.id"
                 v-if="!isLoading && data.length"></div>
        </template>
    </div>
</template>

<script>

export default {

    data: function () {
        return {
            isLoading: true,
            data: [],
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
        limit: {
            type: Number,
            default: () => 4,
        },
    },

    methods: {
        getData() {
            this.data = [];

            if (this.limit) {
                this.url = this.url + '?limit=' + this.limit;
            }

            axios.get(this.url)
                .then(res => {
                    this.data = res.data.data ? res.data.data : [];
                    this.isLoading = false;
                });
        },
    }
}
</script>
