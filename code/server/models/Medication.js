module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('medication', {
    medicationName: DataTypes.STRING,
    medicationTypeId: DataTypes.INTEGER
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Error.associate = function (models) {
  }

  return Error
}
