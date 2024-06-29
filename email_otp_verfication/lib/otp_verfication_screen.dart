import 'package:email_otp_verfication/services/login_services.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerification extends StatefulWidget {
  final String email;
  final String userId;
  const OTPVerification({
    Key? key,
    required this.email,
    required this.userId,
  }) : super(key: key);
  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  var otp = '';
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[350],
            radius: 25.0,
            child: CircleAvatar(
              backgroundColor: Colors.pink[100],
              child: const Icon(
                Icons.mail_outline_rounded,
                color: Colors.pink,
              ),
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          const Text(
            'Please check your email',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          RichText(
              text: TextSpan(
                  text: "We'eh sent a code to ",
                  style: const TextStyle(color: Colors.grey, fontSize: 20),
                  children: [
                TextSpan(
                  text: widget.email,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ])),
          SizedBox(
            height: h * 0.03,
          ),
          SizedBox(
            width: w * 0.5,
            child: PinCodeTextField(
              onCompleted: (pin) {
                  setState(() {
                    otp = pin;
                  });
                },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                selectedColor: Colors.pink,
                inactiveColor: Colors.pink,
              ),
              enablePinAutofill: true,
              keyboardType: TextInputType.number,
              textStyle: const TextStyle(color: Colors.pink),
              boxShadows: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.grey,
                  blurRadius: 10,
                )
              ],
              appContext: context,
              length: 4,
            ),
            
          ),
          SizedBox(
            height: h * 0.01,
          ),
          RichText(
            text: const TextSpan(
                text: "Didn't get a code?",
                style: TextStyle(color: Colors.grey, fontSize: 20),
                children: [
                  TextSpan(
                      text: "Click to resend",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ))
                ]),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: w * 0.1,
                    right: w * 0.1,
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                onPressed: () {
                  LoginServices.checkOtp(
                    widget.userId,
                    otp,
                  ).then((value) => {
                    if (value[0]['message'] == "Valid OTP") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Valid OTP'),
                        ),
                      )
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid OTP'),
                        ),
                      )
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: w * 0.1,
                    right: w * 0.1,
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: const Text(
                    'Verify',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
