import Vue from 'vue/dist/vue.esm.js'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#mount_target',
    data: {
      message: 'hello, vue'
    }
  })
})
