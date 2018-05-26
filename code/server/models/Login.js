module.exports = (sequelize, DataTypes) => {
  const Error = sequelize.define('login', {
    email: {
      type: DataTypes.STRING,
      unique: true
    },
    password: DataTypes.STRING,
    authlevel: DataTypes.INTEGER
  }, {
    freezeTableName: true,
    timestamps: false
  })

  Error.prototype.comparePassword = function (password) {
    return password === this.password
  }

  Error.associate = function (models) {
  }

  return Error
}
