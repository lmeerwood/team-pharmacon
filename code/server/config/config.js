
module.exports = {
  port: process.env.PORT || 8080,
  db: {
    database: process.env.DB_TABLE || 'petdatabase',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASS || 'password',
    options: {
      dialect: 'mysql',
      host: process.env.DB_HOST || 'pet.hopto.me',
      pool: {
        max: 10,
        min: 0,
        acquire: 30000,
        idle: 10000
      }
    }
  },
  authentication: {
    jwtSecret: process.env.JWT_SECRET || 'secret'
  }
}
