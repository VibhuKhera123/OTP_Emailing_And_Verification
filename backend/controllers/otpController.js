const Otp = require('../models/dbDetails').db.Otp;

const addOtp = async (otp, userId) => {
    let otpDetails = {
      otp: otp,
      userId: userId,
    };
    try {
      const newOtp = await Otp.create(otpDetails);
      return { status: true, message: 'Otp created successfully' };
    } catch (e) {
      return { status: false, message: e.message };
    }
  };

  const getOtpDetails = async (req, res) => {
    try {
      const otp = await Otp.findOne({
        where: {
          userId: req.params.userId,
        },
      });
  
      if (!otp) {
        return res.status(200).send({ status: false, message: 'Otp not found' });
      }
  
      // Check if user-entered OTP matches stored OTP
      const userEnteredOtp = req.params.otp;
      if (otp.otp !== userEnteredOtp) {
        return res.status(200).send({ status: false, message: 'Invalid OTP' });
      }else{
          await Otp.destroy({
              where: {
                  userId: req.params.userId
              }
          });
        return res.status(200).send({ status: true, message: 'Valid OTP' });
      }
  
      
    } catch (e) {
      res.status(200).send({ status: false, message: e.message });
    }
  };
  

const deleteOtp = async (req,res)=>{
    try{
        const otp = await Otp.destroy({
            where: {
                userId: req.params.userId
            }
        });
        res.status(200).send({'status':true,'message':'Otp deleted successfully'});
    }
    catch(e){
        res.status(200).send({'status':Error,'message':e});

    }
}

module.exports = {
    addOtp,
    deleteOtp,
    getOtpDetails
}