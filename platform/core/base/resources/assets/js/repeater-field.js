import Vue from 'vue';
import RepeaterComponent from './form/fields/RepeaterComponent';

Vue.prototype.__ = key => {
    return _.get(window.trans, key, key);
};

Vue.component('repeater-component', RepeaterComponent);

new Vue({
    el: '#main'
});
