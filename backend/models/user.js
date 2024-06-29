const { Sequelize, DataTypes } = require("sequelize");

module.exports = (sequelize,DataTypes)=>{
    const User = sequelize.define(
        "user",{
            name:{
                type: DataTypes.STRING,
                allowNull: false,
                unique: true, 
            },
            email:{
                type: DataTypes.STRING,
                allowNull: false,
                unique: true, 
            }
        }
    );
    return User;
}