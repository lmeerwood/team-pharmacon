module.exports = (sequelize, DataTypes) => {
  const Severity = sequelize.define('severity', {
    level: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Severity.associate = function (models) {
    Severity.hasMany(models.error)
  }

  return Severity
}
