module.exports = (sequelize, DataTypes) => {
  const Errortype = sequelize.define('errortype', {
    errorType: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Errortype.associate = function (models) {
  }

  return Errortype
}
