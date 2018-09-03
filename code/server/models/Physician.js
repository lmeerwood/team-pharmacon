module.exports = (sequelize, DataTypes) => {
  const Physician = sequelize.define('physician', {
    physicianSurname: DataTypes.STRING,
    physicianFirstName: DataTypes.STRING,
    providerNumber: DataTypes.STRING,
    physicianComment: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Physician.associate = function (models) {
    Physician.hasMany(models.error)
  }

  return Physician
}
