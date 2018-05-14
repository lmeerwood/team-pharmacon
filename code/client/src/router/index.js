import Vue from 'vue'
import Router from 'vue-router'
import Main from '@/components/Main'
import Error from '@/components/Error'
import Login from '@/components/Login'
import Physician from '@/components/Physician'
import viewPhysician from '@/components/viewPhysician'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      redirect: '/main'
    },
    {
      path: '/main',
      name: 'Main',
      component: Main
    },
    {
      path: '/error',
      name: 'Error',
      component: Error
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/physician',
      name: 'Physician',
      component: Physician
    },
    {
      path: '/physician/view',
      name: 'viewPhysician',
      component: viewPhysician
    }
  ]
})
