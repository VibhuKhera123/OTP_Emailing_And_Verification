const { Sequelize, DataTypes } = require("sequelize");
const dbConfig = require("../config");

const sequelize = dbConfig.getClient();


sequelize.authenticate().then(()=>{
    console.log('Connection has been established successfully.');
}).catch((e)=>{
    console.error('Unable to connect to the database:', e);
});


const db = {};
db.Sequelize = Sequelize;
db.Sequelize = sequelize;

db.User = require('./user')(sequelize,DataTypes);
db.Otp = require('./otp')(sequelize,DataTypes);

sequelize.sync()
  .then(() => {
    console.log('Database and tables synced');
  })
  .catch((error) => {
    console.error('Error syncing database:', error);
  });

module.exports = {
    db,
    sequelize
};