import axios from 'axios'
import store from '@/store/store'

export default() => {
  return axios.create({
    baseURL: process.env.BASE_URL,
    headers: {
      Authorization: `Bearer ${store.state.token}`
    }
  })
}
