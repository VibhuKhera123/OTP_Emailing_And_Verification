const router = require('express').Router();

const otpController = require('../controllers/otpController');


// router.post('/addOtp',otpController.addOtp);
router.delete('/deleteOtp/:userId',otpController.deleteOtp);
router.get('/getOtpDetails/:userId/:otp',otpController.getOtpDetails);

module.exports = router;