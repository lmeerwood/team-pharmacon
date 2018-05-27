module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('worker', {
    workerFirstName: DataTypes.STRING,
    workerSurname: DataTypes.STRING,
    WorkerRole: DataTypes.STRING,
    workerActive: DataTypes.BOOLEAN
  },

  {
    freezeTableName: true,
    timestamps: false
  })

  Error.associate = function (models) {
  }

  return Error
}
