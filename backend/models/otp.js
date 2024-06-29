const { Sequelize, DataTypes } = require("sequelize");

module.exports = (sequelize,DataTypes)=>{
    const Otp = sequelize.define(
        "otp",{
            otp:{
                type: DataTypes.STRING,
                allowNull: false,
            },
            userId:{
                type: DataTypes.INTEGER,
                allowNull: false,
            }
        }
    );
    return Otp;
}