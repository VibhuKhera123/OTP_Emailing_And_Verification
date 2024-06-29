const nodeEmailer = require('nodemailer');

var transport = nodeEmailer.createTransport({
    service: 'gmail',
    auth:{
        user: 'vibhukhera3@gmail.com',
        pass: 'kmrz euzn dgxx kabs',
    },
});

const sendEmail = async (to, subject, text) => {
    const mailOptions = {
      from: '"Vibhu Khera" <vibhukhera3@gmail.com>',
      to: to,
      subject: subject,
      text: text,
    };
  
    try {
      await transport.sendMail(mailOptions);
      console.log('Email sent successfully');
    } catch (error) {
      console.error('Error sending email:', error);
    }
  };


  module.exports = { sendEmail };



//   const nodemailer = require('nodemailer');

// const transporter = nodemailer.createTransport({
//     host: 'smtp.ethereal.email',
//     port: 587,
//     auth: {
//         user: 'ford13@ethereal.email',
//         pass: 'SQvxbE6bk3MVJBvBam'
//     }
// });

// const sendEmail = async (to, subject, text) => {
//   const mailOptions = {
//     from: '"Vibhu Khera" <ford13@ethereal.email>', // Use a dummy email address
//     to: to,
//     subject: subject,
//     text: text,
//   };

//   try {
//     await transporter.sendMail(mailOptions);
//     console.log('Email sent successfully');
//     console.log(mailOptions);
//   } catch (error) {
//     console.error('Error sending email:', error);
//   }
// };

// module.exports = { sendEmail };
