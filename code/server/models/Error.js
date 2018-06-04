module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('error', {
    errorDate: DataTypes.STRING,
    errorTime: DataTypes.STRING,
    wasWorkerNotified: DataTypes.BOOLEAN,
    wasPhysicianNotified: DataTypes.BOOLEAN,
    iimsCompleted: DataTypes.BOOLEAN,
    generalComment: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Error.associate = function (models) {
    Error.belongsTo(models.errortype)
    Error.belongsTo(models.severity)
    Error.belongsTo(models.medication)
    Error.belongsTo(models.physician)
    Error.belongsTo(models.patient)
    Error.belongsTo(models.location)
    Error.belongsTo(models.worker, {foreignKey: 'errorCausedByWorker'})
  }
  return Error
}
