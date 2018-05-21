
module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define('User', {
    email: {
      type: DataTypes.STRING,
      unique: true
    },
    password: DataTypes.STRING
  }, {
    freezeTableName: true,
    timestamps: false
  })

  User.prototype.comparePassword = function (password) {
    return password === this.password
  }

  User.associate = function (models) {
  }

  return User
}
