import Api from '@/services/Api'

export default {
  getAll () {
    return Api().get('/api/v1/query/medicationtype')
  },
  addMedicationType (medicationType) {
    console.log('inside medication type service. Values: ' + medicationType)
    return Api().post('/api/v1/query/medicationtype', medicationType)
  },
  getMedicationType (medicationTypeId) {
    var url = '/api/v1/query/medicationtype/' + medicationTypeId
    return Api().get(url)
  },
  updateMedicationType (medicationTypeId, medicationType) {
    var url = '/api/v1/query/medicationtype/' + medicationTypeId
    return Api().post(url, medicationType)
  },
  isMedicationTypeValid (medicationType) {
    var url = '/api/v1/query/medicationtype/isvalid/' + medicationType
    return Api().get(url)
  }
}
