<template>
    <div class="bb-comment-box d-flex" :class="{'has-rating': hasRating}">
        <avatar v-if="!isEdit" :user="data.userData"></avatar>
        <form class="bb-textarea" @submit="this.postComment">
            <textarea class="form-control" rows="1" name="comment" placeholder="Share your thoughts about that" @change="onChange" :value="value" />
            <div class="bb-textarea-error alert alert-danger m-0" v-if="error">
                <span>{{ error }}</span>
            </div>
            <div class="bb-textarea-footer">
                <div class="bb-textarea-footer-left">

                </div>

                <div class="bb-textarea-footer-right" v-if="!isEdit">
                    <button type="submit" v-if="data.userData" :class="'post-btn'">{{ __('Post as') }} {{ data.userData.name }}</button>
                    <button type="submit" v-if="!data.userData" class="post-btn post-none">{{ __('Login to Post') }}</button>
                </div>

                <div class="bb-textarea-footer-right" v-if="isEdit">
                    <button type="button" class="post-btn cancel-btn" @click="onCancel">{{ __('Cancel') }}</button>
                    <button type="submit" v-if="data.userData" :class="'post-btn' + (isSending ? ' button-loading' : '')">{{ __('Update') }}</button>
                </div>
            </div>

            <input type="hidden" name="reference" :value="reference" />
            <input type="hidden" name="parent_id" :value="parentId" />
            <input type="hidden" name="status" :value="status" />
            <input type="hidden" name="comment_id" :value="commentId" v-if="isEdit" />
        </form>
    </div>
</template>

<script>
import Avatar from './Avatar';
import { setResizeListeners } from '../helpers';
import Http from '../../service/http';

export default {
    name: 'CommentBox',
    components: {
        Avatar,
    },
    data: () => {
        return {
            isSending: false,
            error: false,
            value: '',
        }
    },
    methods: {
        onChange(e) {
            this.value = e.target.value;
        },
        postComment(e) {
            e.preventDefault();
            if (!this.data.userData) {
                this.openLoginForm();
            } else {
                const formData = $(e.target).serializeData()
                const index = this.onSuccess(formData, true)
                this.isSending = true;
                console.log(formData);
                console.log('sssssss1', this.postUrl);
                Http.post(this.postUrl, formData)
                    .then(({ data }) => {
                        this.isSending = false;
                        if (!data.error) {
                            this.value = '';
                            const textarea = this.$el.querySelector('textarea');
                            this.onSuccess(data.data, false, index);
                            this.error = false;
                            textarea.value = '';
                            textarea.classList.remove('focused')
                            textarea.style.height = 'auto';
                            this.updateCount();
                        } else {
                            this.onSuccess(null, false, -1);
                            this.error = JSON.parse(data.message).comment[0];//data.message[Object.keys(data.message)[0]][0]
                        }
                    }, error => {
                        this.onSuccess(null, false, -1);
                        this.isSending = false;
                        this.error = error.response?.statusText ?? error.message;
                        console.log(this.error);
                    })
            }
        }
    },
    props: {
        email: {
          type: String,
          default: '',
        },
        status: {
            type: String,
            default: 'published',
        },
        parentId: {
            type: Number,
            default: 0,
        },
        commentId: {
            type: Number,
            default: 0,
        },
        onSuccess: {
            type: Function,
            default: () => null
        },
        onCancel: {
            type: Function,
            default: () => null
        },
        autoFocus: {
            type: Boolean,
            default: false,
        },
        isEdit: {
            type: Boolean,
            default: false,
        },
        defaultValue: {
            type: String,
            default: '',
        },
        hasRating: {
            type: Boolean,
            default: false,
        }
    },
    mounted() {
        setResizeListeners(this.$el, 'textarea');

        if (this.autoFocus) {
            this.$el.querySelector('textarea').focus()
        }

        if (this.defaultValue) {
            this.value = this.defaultValue;
        }
    },
    watch: {
       email: function (val) {
           if (val !== '') {
               console.log(this.reference);
               console.log(this.parentId);
               console.log(this.commentId);
               const formdata = new FormData();
               formdata.append('comment', 'I invite You.');
               formdata.append('parent_id', this.parentId);
               formdata.append('reference', this.reference);
               formdata.append('status', 'private');
               Http.post(this.postUrl, formdata)
                   .then(({ data }) => {
                       this.isSending = false;
                       if (!data.error) {
                           this.value = '';
                           const textarea = this.$el.querySelector('textarea');
                           this.onSuccess(data.data, false, index);
                           this.error = false;
                           textarea.value = '';
                           textarea.classList.remove('focused')
                           textarea.style.height = 'auto';
                           this.updateCount();
                       } else {
                           this.onSuccess(null, false, -1);
                           this.error = JSON.parse(data.message).comment[0];//data.message[Object.keys(data.message)[0]][0]
                       }
                   }, error => {
                       this.onSuccess(null, false, -1);
                       this.isSending = false;
                       this.error = error.response?.statusText ?? error.message;
                       console.log(this.error);
                   })
           }
       }
    },
    inject: ['getUser', 'data', 'reference', 'postUrl', 'updateCount', 'openLoginForm']
}
</script>
