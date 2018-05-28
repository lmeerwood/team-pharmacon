module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('error', {
    errorDate: DataTypes.STRING,
    errorTime: DataTypes.STRING,
    errorTypeId: DataTypes.INTEGER,
    locationId: DataTypes.INTEGER,
    errorCausedByWoker: DataTypes.INTEGER,
    wasWorkerNotified: DataTypes.BOOLEAN,
    wasPhysicianNotified: DataTypes.BOOLEAN,
    iimsCompleted: DataTypes.BOOLEAN,
    generalComment: DataTypes.STRING,
    severityId: DataTypes.INTEGER,
    medicationId: DataTypes.INTEGER,
    patientId: DataTypes.INTEGER,
    physicianId: DataTypes.INTEGER
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Error.associate = function (models) {
  }

  return Error
}
