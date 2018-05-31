module.exports = (sequelize, DataTypes) => {
  const Medication = sequelize.define('medication', {
    medicationName: DataTypes.STRING,
    medicationTypeId: DataTypes.INTEGER
  },
  {
    freezeTableName: true,
    timestamps: false
  })

  Medication.associate = function (models) {
  }

  return Medication
}
