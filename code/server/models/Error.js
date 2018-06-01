module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('error', {
    errorDate: DataTypes.STRING,
    errorTime: DataTypes.STRING,
    locationId: DataTypes.INTEGER,
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
    Error.belongsTo(models.errortype, {as: 'ErrorType'})
    Error.belongsTo(models.severity, {as: 'Severity'})
    Error.belongsTo(models.medication, {as: 'Medication'})
    Error.belongsTo(models.physician, {as: 'Physician'})
    Error.belongsTo(models.patient, {as: 'Patient'})
    Error.belongsTo(models.location, {as: 'Location'})
    Error.belongsTo(models.worker, {as: 'Worker', foreignKey: 'errorCausedByWorker'})
  }
  return Error
}
