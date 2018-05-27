module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('patient', {
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

  Error.associate = function (models) {
  }

  return Error
}
