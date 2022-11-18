import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tradeswap_front/pages/signup.dart';
import 'package:tradeswap_front/services/networkHandler.dart';
import 'package:tradeswap_front/services/token_store.dart';
import '../widgets/checkbox.dart';
import 'package:tradeswap_front/pages/home/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String password = '';
  String email = '';
  String error = '';

  Future<String> loginUser(String email, String password) async {
    try {
      String resp = await NetworkHandler.post(
          '/auth', {"username": email, 'password': password});
      print(resp);
      Map<String, dynamic> userInfo = jsonDecode(resp);
      if (userInfo['status'] == 200) {
        SecureStore.storeToken("token", userInfo['data']['token']);
        SecureStore.createUser(userInfo['data']['user']);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (error) {
      print(error);
    }
    return "Null";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset('assets/images/sign_in.png').image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(top: 210),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Sign In',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 55)),
                          Text('Sign in to continue.',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1, top: 55),
                    child: SingleChildScrollView(
                      child: Form(
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: Column(children: [
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                setState(() {
                                  error = "";
                                  email = value;
                                });
                              },
                              decoration: const InputDecoration(
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50)))),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            TextField(
                              obscureText: true,
                              onChanged: (value) {
                                setState(() {
                                  error = "";
                                  password = value;
                                });
                              },
                              decoration: const InputDecoration(
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50)))),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    MyStatefulWidget(),
                                    Text('remember me'),
                                  ],
                                ),
                                const Text('forget password?'),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.yellow,
                                    padding: const EdgeInsets.all(16.0),
                                    textStyle: const TextStyle(fontSize: 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                  ),
                                  onPressed: () async {
                                    // String usertype =
                                    await loginUser(email, password);
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) => HomePage()));
                                    // if (usertype == "Null") {
                                    //   Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           (usertype == "ADMIN")
                                    //               ? const LoginPage()
                                    //               : const HomePage(),
                                    //     ),
                                    //   );
                                    // }
                                  },
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'dont have an account?',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUpScreen()));
                                        },
                                        child: const Text(
                                          'Sign up',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 20),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
