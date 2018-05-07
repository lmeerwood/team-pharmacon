import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import List from '@/components/List'
import Login from '@/components/Login'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/to-do',
      name: 'ToDo',
      component: List
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    }
  ]
})
