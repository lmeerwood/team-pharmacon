
module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('errorForm', {
    date: DataTypes.STRING,
    time: DataTypes.STRING,
    patientFirstName: DataTypes.STRING,
    patientSurname: DataTypes.STRING,
    patientId: DataTypes.STRING,
    patientType: DataTypes.STRING,
    errorType: DataTypes.STRING,
    errorComment: DataTypes.STRING,
    workerAtFault: DataTypes.STRING,
    workerNotified: DataTypes.BOOLEAN,
    location: DataTypes.STRING,
    iimsCompleted: DataTypes.BOOLEAN,
    medication: DataTypes.STRING,
    severity: DataTypes.STRING,
    physicianNotified: DataTypes.BOOLEAN,
    physicianFirstName: DataTypes.STRING,
    physicianSurname: DataTypes.STRING,
    providerNumber: DataTypes.STRING,
    physicianComments: DataTypes.STRING,
    dianosis: DataTypes.STRING // TODO: fix this error in database
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Error.associate = function (models) {
  }

  return Error
}
