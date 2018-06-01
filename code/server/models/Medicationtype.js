module.exports = (sequelize, DataTypes) => {
  const MedicationType = sequelize.define('medicationtype', {
    medicationType: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  MedicationType.associate = function (models) {
    MedicationType.hasMany(models.medication)
  }

  return MedicationType
}
