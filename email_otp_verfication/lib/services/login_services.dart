import 'dart:convert';

import 'package:email_otp_verfication/api_url_constants.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  static Future createNewUser(String userName, String Email) async {
    try {
      var url = Uri.parse(createAccount);
      print(url);
      var res = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body:
              jsonEncode(<String, dynamic>{'name': userName, 'email': Email}));
      print(res.body);
      return jsonDecode('[' + res.body + ']');
    } catch (e) {
      print(e);
      return e;
    }
  }

  static Future checkOtp(String userId, String otp) async {
    try {
      var url = Uri.parse('$getOtp$userId/$otp');
      var res = await http.get(url);
      print(res.body);
      return jsonDecode('[' + res.body + ']');
    } catch (e) {
      print(e);
      return e;
    }
  }
}
