module.exports = (sequelize, DataTypes) => {
  const Location = sequelize.define('location', {
    errorLocation: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Location.associate = function (models) {
  }

  return Location
}
