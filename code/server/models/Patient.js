module.exports = (sequelize, DataTypes) => {
  const Patient = sequelize.define('patient', {
    patientHospitalId: {
      type: DataTypes.STRING,
      unique: true
    },
    patientFirstName: DataTypes.STRING,
    patientSurname: DataTypes.STRING,
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Patient.associate = function (models) {
    Patient.belongsTo(models.patienttype)
    Patient.hasMany(models.error)
  }

  return Patient
}
