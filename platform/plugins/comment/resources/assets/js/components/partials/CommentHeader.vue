<template>
    <div class="bb-comment-header">
        <div class="bb-comment-header-top d-flex justify-content-between">
            <strong><button type="button" class="btn btn-primary">
                {{  data.attrs.count_all }} {{ __('Comments') }}
            </button></strong>
            <strong id="invite">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    INVITE
                </button>
            </strong>
            <dropdown
                @click="() => !isLogged && openLoginForm()"
                icon="fas fa-comment"
                :selected="{name: isLogged ? userData.name : 'Login'}"
                :options="isLogged && [
                    {name: __('Logout'), onClick: logout}
                ]"
                :no-select-mode="true"
            />
        </div>
        <!-- Modal -->
        <div class="modal fade in" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <div>
                    <h5 class="modal-title" id="exampleModalLabel">Invite Someone</h5>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                        <input v-model="email" :style="errorFlage == 1 || errorFlage == 2 ? 'border: 1px solid red;' : ''" placeholder="username@website.com" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                        <small v-if="errorFlage == 1" id="emailHelp" class="form-text text-muted">{{errorMessage}}</small>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="close" data-dismiss="modal" hidden>Close</button>
                <button type="button" class="btn btn-warning" @click="sendEmail">SEND</button>
            </div>
            </div>
        </div>
        </div>

        <div class="bb-comment-header-bottom d-flex justify-content-between">
            <button class="btn btn-sm p-0 recommend-btn bb-heart" :class="{'font-weight-bold': isRecommended}" @click="onRecommend">
                <span data-text="❤" :class="{'active': isRecommended}">❤</span> {{ !isRecommended ? __('Recommend') : __('Recommended') }}
                <span class="badge badge-secondary" v-if="countRecommend > 0">{{ countRecommend }}</span>
            </button>

            <dropdown
                :selectedValue="data.sort"
                v-on:updateOption="onChangeSort"
                :options="[
                    {name: __('Newest'), value: 'newest'},
                    {name: __('Best'), value: 'best'},
                    {name: __('Oldest'), value: 'oldest'}
                ]"
            />
        </div>
    </div>
</template>

<script>
import Http from '../../service/http';
import Ls from '../../service/Ls';
import Dropdown from "./Dropdown";
import StarRating from './StarRating';
import emailjs from 'emailjs-com';
export default {
    name: 'Header',
    components: {
        Dropdown,
        StarRating,
    },
    data: () => {
        return {
            errorFlage: 0,
            errorMessage: '',
            email: '',
            commentCounts: 0,
            isRecommended: false,
            countRecommend: 0,
        }
    },
    methods: {
        sendEmail () {
            if (this.email == '') {
                this.errorFlage = 1;
                this.errorMessage = 'Email is a required field.';
                return;
            }
            else if (this.email.indexOf('@') === -1) {
                this.errorFlage = 1;
                this.errorMessage = 'Email must be include @ symbol';
                return;
            }
            // Http.post('http://localhost:8000/api/v1/comments/usercheck', {data: this.email})
            //     .then(res => {
            //     if (res.data.error === false && res.data.data === false) {
            //         this.errorFlage = 1;
            //         this.errorMessage = 'This Email does not exist';
            //         return;
            //     }
            //     else if (res.data.error === false && res.data.data === true) {
            //         document.querySelector('#close').click();
            //         this.errorFlage = 0;
            //         this.emailData(this.email);
            //     }
            // })
            try {
                emailjs.init('adonis11300522@gmail.com')
                emailjs.send('service_b4qmiqc', 'template_fv38whr',{
                        to_name: 'adonis11300522@gmail.com',
                        from_name: 'adonis11300522@gmail.com',
                        message: '<p>Hellow</p>'
                    })

            } catch(error) {
                console.log({error})
            }
        },
        logout() {
            Http.post(this.logoutUrl).then(() => {
                Ls.remove('auth.token');
                this.getUser();
            });
        },
        async onRecommend() {
            const res = await Http.post(this.recommendUrl, { reference: this.reference });
            this.isRecommended = !res.data.data;
            this.countRecommend += this.isRecommended ? 1 : -1;
        }
    },
    props: {
        recommend: {
            type: Object,
        },
        hasRating: {
            type: Boolean,
            default: false,
        },
        emailData: {
            type: Function
        }
    },
    computed: {
        isLogged() {
            return this.data.userData;
        },
        userData() {
            return this.data.userData ?? {}
        },
    },
    watch: {
        recommend() {
            if (typeof this.recommend.isRecommended !== 'undefined') {
                this.isRecommended = this.recommend.isRecommended;
                this.countRecommend = this.recommend.count;
            }
        }
    },
    inject: ['reference', 'data', 'getUser', 'openLoginForm', 'onChangeSort', 'logoutUrl', 'recommendUrl']
}
</script>
<style scoped>
  #exampleModalLabel {
    text-align: center;
  }
  .modal-dialog {
    margin-top: 215px;
  }
  .btn-warning {
    background-color: #ED6C02!important;
    color: white!important;
  }
  #emailHelp {
    color: red!important;
  }
  #invite {
      margin-left: -454px;
  }
</style>

