module.exports = (sequelize, DataTypes) => {
  const Login = sequelize.define('login', {
    username: {
      type: DataTypes.STRING,
      unique: true
    },
    password: DataTypes.STRING,
    authlevel: DataTypes.INTEGER
  }, {
    freezeTableName: true,
    timestamps: false
  })

  Login.prototype.comparePassword = function (password) {
    return password === this.password
  }

  Login.associate = function (models) {
  }

  return Login
}
