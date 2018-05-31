module.exports = (sequelize, DataTypes) => {
  const Medication = sequelize.define('medication', {
    medicationName: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Medication.associate = function (models) {
    Medication.hasMany(models.error)
    Medication.belongsTo(models.medicationtype)
  }

  return Medication
}
