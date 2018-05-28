module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('location', {
    errorLocation: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Error.associate = function (models) {
  }

  return Error
}
