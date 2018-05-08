import Login from '@/components/Login'
import Vue from 'vue'

describe('Login.vue', () => {
  it('Displays username from the Login', () => {
    // Build Components
    const Constructor = Vue.extend(Login)
    const LoginComponent = new Constructor().$mount()

    // Set value of Username
    LoginComponent.username = 'somebody'

    // Find button
    const button = LoginComponent.$el.querySelector('v-btn')

    // Simulate click event
    const clickEvent = new window.Event('click')
    button.dispatchEvent(clickEvent)
    LoginComponent._watcher.run()
  })
})
