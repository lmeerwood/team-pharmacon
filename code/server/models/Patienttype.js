module.exports = (sequelize, DataTypes) => {
  const Patienttype = sequelize.define('patienttype', {
    patientType: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Patienttype.associate = function (models) {
    Patienttype.hasMany(models.patient)
  }

  return Patienttype
}
