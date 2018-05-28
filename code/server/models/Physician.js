module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('physician', {
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

  Error.associate = function (models) {
  }

  return Error
}
