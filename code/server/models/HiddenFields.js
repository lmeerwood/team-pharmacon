module.exports = (sequelize, DataTypes) => {
  const HiddenFields = sequelize.define('hiddenfields', {
    showDate: DataTypes.BOOLEAN,
    showTime: DataTypes.BOOLEAN,
    showPatientFields: DataTypes.BOOLEAN,
    showErrorType: DataTypes.BOOLEAN,
    showMedicationFields: DataTypes.BOOLEAN,
    showWorker: DataTypes.BOOLEAN,
    showWorkerNotified: DataTypes.BOOLEAN,
    showLocation: DataTypes.BOOLEAN,
    showIIMScompleted: DataTypes.BOOLEAN,
    showSeverity: DataTypes.BOOLEAN,
    showPhysicianFields: DataTypes.BOOLEAN,
  },
  {
    freezeTableName: true,
    timestamps: false
  })

 return HiddenFields
}
