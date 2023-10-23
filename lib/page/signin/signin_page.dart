import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/page/signin/popUpAlert/alert.dart';
import 'package:web_booking/utils/app_route_config.dart';
import 'package:http/http.dart' as http;

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

TextEditingController _user = TextEditingController();
TextEditingController _password= TextEditingController();

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/VesselHA1.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 160,
          ),
          Container(
            height: 440,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildAppbarImage(),
                _buildAppbarName(),
                const SizedBox(
                  height: 30,
                ),
                _buildInputUser(),
                const SizedBox(
                  height: 10,
                ),
                CupertinoButton(
                  color: Colors.white70,
                  onPressed: () {
                    signin(_user.text.toString(),
                        _password.text.toString());
                  },
                  child: Text(
                    'SIGN IN',
                    style:
                        TextStyle(color: button, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    context.go(AppRoutes.SignUpRoute);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                            fontSize: 14,
                            color: haian,
                            fontWeight: FontWeight.w500),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Future<void> signin(String username, String password) async {
    var url = URL_LOGIN;
    Map data = {
      'username': username,
      'password': '123@ha'.toString()+password+'haian'.toString(),
    };
    var body = json.encode(data);
    if (username.isNotEmpty && password.isNotEmpty) {
      const CircularProgressIndicator();
      // EasyLoading.show(
      //   status: 'Loading...',
      //   maskType: EasyLoadingMaskType.black,
      //   dismissOnTap: false,
      //   );
      final response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"}, body: body);
      if (response.statusCode == 200) {
        // EasyLoading.dismiss();
        var body = response.body;
        var data = jsonDecode(body.toString());
        // print(data['token']);
        Map<String, dynamic> decodedToken = JwtDecoder.decode(data['token']);
        var results = decodedToken.values.toList();
        tokenLogin = results[2];
        user = results[3].substring(0, 5);
        code = results[4];
        // print(user);
        // print(tokenLogin);
        // print(code);
        if (user == 'admin') {
          _user.clear();
          _password.clear();
          // ignore: use_build_context_synchronously
          // setState(() {
            visibi = true;
          // });
          context.go(AppRoutes.AdminRoute);
        }
        else {
          _user.clear();
          _password.clear();
          // setState(() {
            visibi = false;
            // });
          context.go(AppRoutes.UserRoute);
        }
      } else {
        LoginAlert(context);
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid")));
    }
  }
}

Widget _buildAppbarImage() {
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Image.asset(
      'assets/images/hats_logo.png',
      height: 100,
      width: 200,
    ),
  );
}

Widget _buildAppbarName() {
  return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        'Welcome to HAI AN',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[900]),
      ));
}

Widget _buildInputUser() {
  return Column(children: <Widget>[
    Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white54),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            height: 50,
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _user,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
              decoration: const InputDecoration(
                  hintText: "User Name",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              controller: _password,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
              decoration: const InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  border: InputBorder.none),
            ),
          )
        ],
      ),
    )
  ]);
}