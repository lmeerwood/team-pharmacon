module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('medicationtype', {
    medicationType: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Error.associate = function (models) {
  }

  return Error
}
