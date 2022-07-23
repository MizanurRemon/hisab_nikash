// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, unused_import, non_constant_identifier_names, unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'Model/Login_response.dart';
import 'API/Base_url.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const LoginPage());
}

void getHttp() async {
  successToast("hi");
  try {
    var response = await Dio().get('http://www.google.com');
    print(response);
  } catch (e) {
    print(e);
  }
}

//var url = "http://192.168.0.159:1337/api/";

/*Future<Login_response> loginUser() async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return Login_response.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load api');
  }
}*/

Future<Login_response> loginUser(String phone, String password) async {
  var dio = Dio();
  final response = await dio.post(Base_url().url + '/user_login',
      data: {'phone': phone, 'password': password});

  var data = response.data.toString();

  print(data);

  successToast(data);

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    successToast("1 " + response.data);
    return Login_response.fromJson(jsonDecode(response.data));
    //String responseString = response.body;
    //successToast(responseString);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    errorToast("error");
    throw Exception('Failed to create album.');
  }
}

void successToast(var text) {
  Fluttertoast.showToast(
      msg: text,
      // message
      toastLength: Toast.LENGTH_SHORT,
      // length
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.black,
      backgroundColor: const Color.fromARGB(255, 226, 226, 226) // location
      );
}

void errorToast(var text) {
  Fluttertoast.showToast(
      msg: text,
      // message
      toastLength: Toast.LENGTH_SHORT,
      // length
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      backgroundColor: Colors.red);
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

  //late Future<Login_response> login;
  late Login_response login_response;

  @override
  void initState() {
    super.initState();
    //login = loginUser();
    //getHttp();

    //loginUser("01535166352", "123456");
    successToast("init state");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    
    successToast("did dependencies change");
  }
  
  @override
  void didUpdateWidget(covariant LoginState oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    
    successToast("did update widget");
  }

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
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
                                          onPressed: () async {
                                            var phone = phoneController.text
                                                .toString()
                                                .trim();

                                            var password = passwordController
                                                .text
                                                .toString()
                                                .trim();

                                            if (phone == "" || password == "") {
                                              if (phone == "") {
                                                errorToast("Empty phone");
                                              } else if (password == "") {
                                                errorToast("Empty password");
                                              }
                                            } else {
                                              Login_response login =
                                                  await loginUser(
                                                      phone, password);
                                              //successToast(Base_url().url);

                                              //call api
                                              setState(() {
                                                //login_response = login;
                                                loginUser(phone, password);
                                              }); /*

                                              FutureBuilder<Login_response>(
                                                future: login,
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    successToast(
                                                        snapshot.data!.message);
                                                  } else {
                                                    errorToast(
                                                        snapshot.data!.message);
                                                  }

                                                  return const CircularProgressIndicator();
                                                },
                                              );*/
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
        ),
      ),
    );
  }
}
