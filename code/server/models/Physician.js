module.exports = (sequelize, DataTypes) => {
  const Physician = sequelize.define('physician', {
    physicianSurname: DataTypes.STRING,
    physicianFirstName: DataTypes.STRING,
    providerNumber: DataTypes.STRING,
    physicianComment: DataTypes.STRING,
    diagnosisID: DataTypes.INTEGER
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Physician.associate = function (models) {
  }

  return Physician
}
