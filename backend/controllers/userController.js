const User = require('../models/dbDetails').db.User;
const otpGenrator = require('../utilities/genrate_otp');
const addOtp = require('./otpController').addOtp;
const sendEmail = require('../utilities/emailService').sendEmail;

const addUser = async (req,res)=>{
    let userDetails = {
        name:req.body.name,
        email:req.body.email,
    }
    try{
        const newUser = await User.create(userDetails);
        const otp = otpGenrator.genrateOtp(); // Generate a 6-digit OTP

    // Call addOtp function to store the OTP in the database
        const otpResponse = await addOtp(otp, newUser.id);

    // Check if OTP was successfully created
    if (otpResponse.status) {
      res.status(201).send({
        status: true,
        message: 'User created successfully. Please verify with OTP',
        user: newUser.id
      });
      await sendEmail(userDetails.email,'Please find the otp to verify for test app!!',`Your OTP is ${otp}`);
    } else {
      res.status(200).send({
        status: false,
        message: 'User created but OTP creation failed: ' + otpResponse.message,
      });
    }
    }
    catch(e){
        res.status(200).send({'status':Error,'message':e});

    }
}


module.exports = {
    addUser
}

