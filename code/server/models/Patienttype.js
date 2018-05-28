module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('patienttype', {
    patientType: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Error.associate = function (models) {
  }

  return Error
}
