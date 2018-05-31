module.exports = (sequelize, DataTypes) => {
  const Diagnosis = sequelize.define('diagnosis', {
    diagnosis: DataTypes.STRING
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Diagnosis.associate = function (models) {
    Diagnosis.belongsTo(models.patient)
    Diagnosis.belongsTo(models.physician)
  }

  return Diagnosis
}
