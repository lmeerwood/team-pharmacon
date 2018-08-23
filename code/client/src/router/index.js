import Vue from 'vue'
import Router from 'vue-router'
import Main from '@/components/Main'
import Error from '@/components/Error'
import toggleError from '@/components/toggleError'
import Login from '@/components/Login'
import User from '@/components/User'
import Physician from '@/components/Physician'
import viewPhysician from '@/components/viewPhysician'
import searchError from '@/components/searchError'
import searchPhysician from '@/components/searchPhysician'
import searchWorker from '@/components/searchWorker'
import store from '@/store/store'
import Worker from '@/components/Worker'
import adminWelcome from '@/components/adminWelcome'
import ErrorType from '@/components/ErrorType'
import searchErrorType from '@/components/searchErrorType'
import MedicationType from '@/components/MedicationType'

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
      path: '/user',
      name: 'User',
      component: User
    },
    {
      path: '/worker',
      name: 'Worker',
      component: Worker
    },
    {
      path: '/searchWorker',
      name: 'searchWorker',
      component: searchWorker
    },
    {
      path: '/editform',
      name: 'toggleError',
      component: toggleError
    },
    {
      path: '/adminWelcome',
      name: 'adminWelcome',
      component: adminWelcome
    },
    {
      path: '/searchPhysician',
      name: 'searchPhysician',
      component: searchPhysician
    },
    {
      path: '/errortype',
      name: 'ErrorType',
      component: ErrorType
    },
    {
      path: '/searchErrorType',
      name: 'searchErrorType',
      component: searchErrorType
    },
    {
      path: '/medicationtype',
      name: 'MedicationType',
      component: MedicationType
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
