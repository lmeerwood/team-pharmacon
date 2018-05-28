module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('severity', {
    level: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Error.associate = function (models) {
  }

  return Error
}
