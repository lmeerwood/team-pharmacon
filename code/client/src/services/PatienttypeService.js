import Api from '@/services/Api'

export default {
  getAll () {
    return Api().get('/api/v1/query/patienttype')
  },
  addPatientType (patientType) {
    console.log('inside patient type service. Values: ' + patientType)
    return Api().post('/api/v1/query/patienttype', patientType)
  },
  getPatientType (patientTypeId) {
    var url = '/api/v1/query/patienttype/' + patientTypeId
    return Api().get(url)
  },
  updatePatientType (patientTypeId, patientType) {
    var url = '/api/v1/query/patienttype/' + patientTypeId
    return Api().post(url, patientType)
  },
  isPatientTypeValid (patientType) {
    var url = '/api/v1/query/patienttype/isvalid/' + patientType
    return Api().get(url)
  }
}
