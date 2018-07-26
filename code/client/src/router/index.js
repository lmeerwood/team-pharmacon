import Vue from 'vue'
import Router from 'vue-router'
import Main from '@/components/Main'
import Error from '@/components/Error'
import toggleError from '@/components/toggleError'
import Login from '@/components/Login'
import Physician from '@/components/Physician'
import viewPhysician from '@/components/viewPhysician'
import searchError from '@/components/searchError'
import store from '@/store/store'

Vue.use(Router)

var router = new Router({
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
    },
    {
      path: '/searchError',
      name: 'searchError',
      component: searchError
    },
    {
      path: '/editform',
      name: 'toggleError',
      component: toggleError
    }
  ]
})

router.beforeEach((to, from, next) => {
  if (to.name !== 'Login' && store.state.token === null) {
    next('/login')
  } else {
    next()
  }
})

export default router
