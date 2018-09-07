import Vue from 'vue'
import Router from 'vue-router'
import JsonExcel from 'vue-json-excel'
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
import searchMedicationType from '@/components/searchMedicationType'
import PatientType from '@/components/PatientType'
import searchPatientType from '@/components/searchPatientType'
import searchUser from '@/components/searchUser'
import downloadData from '@/components/downloadData'

Vue.use(Router)
Vue.component('downloadExcel', JsonExcel)

var router = new Router({
  routes: [
    {
      path: '/',
      redirect: '/adminWelcome'
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
    },
    {
      path: '/searchmedicationtype',
      name: 'searchMedicationType',
      component: searchMedicationType
    },
    {
      path: '/patienttype',
      name: 'PatientType',
      component: PatientType
    },
    {
      path: '/searchpatienttype',
      name: 'searchPatientType',
      component: searchPatientType
    },
    {
      path: '/searchUser',
      name: 'searchUser',
      component: searchUser
    },
    {
      path: '/downloadData',
      name: 'downloadData',
      component: downloadData
    }
  ]
})

// This provides some authentication level checking. If the user is not authenticated
// they will always be redirected to the login page. If the user is a standard user
// they will always be redirected to the error page. If the user is an admin user
// they will be only redirected away from the login page.

router.beforeEach((to, from, next) => {
  if (to.name !== 'Login' && store.state.token === null) {
    next('/login')
  } else if (to.name !== 'Error' && store.state.user.authlevel === 1) {
    next('/Error')
  } else if (to.name === 'Login' && store.state.user.authlevel === 2) {
    next('/adminWelcome')
  } else {
    next()
  }
})

export default router
