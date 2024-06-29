const router = require('express').Router();

const userController = require('../controllers/userController');

router.post('/create-user',userController.addUser);

module.exports = router;