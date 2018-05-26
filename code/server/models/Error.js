module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('error', {
    date: DataTypes.STRING,
    time: DataTypes.STRING,
    errorTypeId: DataTypes.INT,
    locationId: DataTypes.INT,
    errorCausedByWoker: DataTypes.INT,
    wasWorkerNotified: DataTypes.BOOLEAN,
    wasPhysicianNotified: DataTypes.BOOLEAN,
    iimsCompleted: DataTypes.BOOLEAN,
    generalComment: DataTypes.STRING,
    severityId: DataTypes.INT,
    medicationId: DataTypes.INT,
    patientId: DataTypes.INT,
    physicianId: DataTypes.INT
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Error.associate = function (models) {
  }

  return Error
}
