module.exports = (sequelize, DataTypes) => {
  const Patient = sequelize.define('patient', {
    patientHospitalId: DataTypes.STRING,
    patientFirstName: DataTypes.STRING,
    patientSurname: DataTypes.STRING,
    patientTypeId: DataTypes.INTEGER,
    patientDiagnosis: DataTypes.INTEGER
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Patient.associate = function (models) {

  }

  return Patient
}
