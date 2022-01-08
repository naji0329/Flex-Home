<template>
    <div>
        <!--Loading spinner-->
        <div v-if="isLoading" class="tc pv3">
            <div class="m-auto" style="width:20px;">
                <half-circle-spinner
                    :animation-duration="1000"
                    :size="15"
                    color="#808080"
                />
            </div>
        </div>

        <div v-if="!isLoading && data.meta.total === 0" class="tc light-gray-text pa3">
            <div class="f5 mv2 b">{{ __('oops') }}</div>
            <div class="f6 mv2">{{ __('no_transactions') }}</div>
        </div>

        <div v-if="!isLoading && data.meta.total !== 0" class="pv3 ph3-ns">
            <div v-for="item in data.data" :key="item.id" class="mb3">
                <div class="dib light-gray-text">
                    <i class="far fa-clock mr2"></i>
                    <span :title="$sanitize(item.description, {allowedTags: []})"
                          v-html="$sanitize(item.description)"></span>
                    <span></span>
                </div>
            </div>
        </div>

        <div v-if="!isLoading && data.links.next" class="tc light-gray-text">
            <a class="f6 mv2" href="javascript:void(0)" v-if="!isLoadingMore"
               @click="getData(data.links.next)">{{ __('load_more') }}</a>
            <a class="f6 mv2" href="javascript:void(0)" v-if="isLoadingMore">{{ __('loading_more') }}</a>
        </div>

    </div>
</template>

<script>
    import {HalfCircleSpinner} from 'epic-spinners';

    export default {
        components: {
            HalfCircleSpinner
        },

        data() {
            return {
                isLoading: true,
                isLoadingMore: false,
                data: [],
            };
        },

        mounted() {
            this.getData();
        },

        methods: {
            getData(url = null) {
                if (url) {
                    this.isLoadingMore = true;
                } else {
                    this.isLoading = true;
                }
                axios.get(url ? url : '/account/ajax/transactions')
                    .then(res => {
                        let oldData = [];
                        if (this.data.data) {
                            oldData = this.data.data;
                        }
                        this.data = res.data;
                        this.data.data = oldData.concat(this.data.data);
                        this.isLoading = false;
                        this.isLoadingMore = false;
                    });
            },
        }
    }
</script>
