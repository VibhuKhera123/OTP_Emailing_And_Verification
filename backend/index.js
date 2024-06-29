const express = require("express");
const {port} = require('./config');
const app = express();
const cors = require('cors');

//Middleware
app.use(cors());
app.use(express.json());

app.use(express.urlencoded({extended: true}));

const userRouter = require('./routers/userRouter');
const otpRouter = require('./routers/otpRouter');
app.use('/api',userRouter);
app.use('/api',otpRouter);

app.get('/',(req,res)=>{
    res.send('Server is up');
});

app.listen(3000,()=>{
    console.log(`Server is running on port ${port}`);
})