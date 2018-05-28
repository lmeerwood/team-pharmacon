module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('diagnosis', {
    diagnosis: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Error.associate = function (models) {
  }

  return Error
}
