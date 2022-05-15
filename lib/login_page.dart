// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const LoginPage());
}

void successToast(var text) {
  Fluttertoast.showToast(
      msg: text, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.black,
      backgroundColor: const Color.fromARGB(255, 226, 226, 226) // location
      );
}

void errorToast(var text) {
  Fluttertoast.showToast(
      msg: text, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      backgroundColor: Colors.red);

  /*FToast fToast;
  fToast = FToast();



  fToast.showToast(
    toastDuration: const Duration(milliseconds: 500),
    child: Material(
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.face),
          Text(
            text,
            style: const TextStyle(color: Colors.black87, fontSize: 16.0),
          )
        ],
      ),
    ),
    gravity: ToastGravity.CENTER,
  );*/
}

var inpadding = 10.0;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: LoginState(),
        ),
      ),
    );
  }
}

class LoginState extends StatefulWidget {
  const LoginState({Key? key}) : super(key: key);

  @override
  State<LoginState> createState() => _LoginStateState();
}

class _LoginStateState extends State<LoginState> {
  var i = 0;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(inpadding),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  child: Image.asset("Images/hisabnikash.png"),
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Center(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(inpadding),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: phoneController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Phone',
                                    ),
                                    keyboardType: TextInputType.phone,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: passwordController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Password',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // ignore: deprecated_member_use
                                  Container(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        var phone = phoneController.text
                                            .toString()
                                            .trim();

                                        var password = passwordController.text
                                            .toString()
                                            .trim();

                                        if (phone == "" || password == "") {
                                          if (phone == "") {
                                            errorToast("Empty phone");
                                          } else if (password == "") {
                                            errorToast("Empty password");
                                          }
                                        } else {
                                          successToast(phone + " " + password);
                                        }
                                      },
                                      child: const Text(
                                        "Sign In",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color.fromARGB(
                                            255, 55, 90, 16),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
