module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('errortype', {
    errorType: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Error.associate = function (models) {
  }

  return Error
}
