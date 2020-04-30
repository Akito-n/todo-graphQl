import Vue from 'vue/dist/vue.esm.js'
import ApolloClient from 'apollo-boost'
import VueApollo from 'vue-apollo'
import { gql } from 'apollo-boost'

const client = new ApolloClient({
  uri: "http://localhost:3000/graphql",
  request: async operation => {
    operation.setContext({
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content'),
      },
    })
  }
})

const apolloProvider = new VueApollo({
  defaultClient: client
});

Vue.use(VueApollo)

document.addEventListener('DOMContentLoaded', () => {
  const ALL_TASK_QUERY = gql
  `query allTast{
    allTask {
      id
      title
      status
      priority
    }
  }`
  
  // 引数ありなクエリ
  const SEARCH_TASK_QUERY = gql`
  query taskSearchBy($taskName: String!){
    taskSearchBy(taskName: $taskName) {
      id
      title
      status
      priority
    }
  }`
  const app = new Vue({
    el: '#mount_target',
    apolloProvider: apolloProvider,
    mounted(){
      console.log('mounted')
      self = this;
      this.$apollo.query({
        query: ALL_TASK_QUERY
      })
      .then(function(result){
        console.log(result)
        self.tasks = result.data.allTask
      })
      .catch(function(e){
        console.log(e)
      })
    },
    data: {
      message: 'hello, vue',
      tasks: []
    },
    methods: {
      search: function (e) {
        this.$apollo.query({
          query: SEARCH_TASK_QUERY,
          variables: {
            taskName: e.target.value
          }
        })
          .then(function (result) {
            self.tasks = result.data.taskSearchBy;
          })
          .catch(function (error) {
            console.log(error);
          });
      }
      
    }
  })
})
