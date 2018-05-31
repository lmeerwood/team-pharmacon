module.exports = (sequelize, DataTypes) => {
  const Worker = sequelize.define('worker', {
    workerFirstName: DataTypes.STRING,
    workerSurname: DataTypes.STRING,
    WorkerRole: DataTypes.STRING,
    workerActive: DataTypes.BOOLEAN
  },

  {
    freezeTableName: true,
    timestamps: false
  })

  Worker.associate = function (models) {
    Worker.hasMany(models.error)
  }

  return Worker
}
