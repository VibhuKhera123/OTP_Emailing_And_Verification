import 'package:email_otp_verfication/otp_verfication_screen.dart';
import 'package:email_otp_verfication/services/login_services.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: w * 0.08,
          right: w * 0.08,
          top: 8.0,
          bottom: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.2,
            ),
            const Text(
              'Enter your details',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            const Text(
              'Name',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                  hintText: 'Enter your name',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: h * 0.1,
            ),
            const Text(
              'Mail',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: 'Enter your mail',
                enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
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
                    email.clear();
                    name.clear();
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
                    if (email.text.isEmpty || name.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Fields cannot be empty'),
                        ),
                      );
                    } else if (!email.text.contains('@')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('invalid email'),
                        ),
                      );
                    } else {
                      LoginServices.createNewUser(name.text, email.text).then((value) => {
                        if(value[0]['status'] == true){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('User created successfully. Please verify with OTP sent to email'),
                            ),
                          ),
                        Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => OTPVerification(
                            email: email.text,
                            userId: value[0]['user'].toString(),
                          ),
                        ),
                      ),
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('User already exists Or an error occured'),
                            ),
                          ),
                        }
                      });
                      
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: w * 0.1,
                      right: w * 0.1,
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: const Text(
                      'Send OTP',
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
      ),
    );
  }
}
