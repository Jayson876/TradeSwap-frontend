import 'package:flutter/material.dart';
import 'package:tradeswap_front/pages/signup.dart';
import 'package:tradeswap_front/pages/startup.dart';

import '../widgets/checkbox.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('trader sign in'),
      // ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset('assets/images/sign_in.png').image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Sign In',
                        style: TextStyle(color: Colors.white, fontSize: 55)),
                    Text('Sign in to continue.',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
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
                      const TextField(
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)))),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)))),
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
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                            onPressed: () {},
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
                              Text(
                                'dont have an account?',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUpScreen()));
                                  },
                                  child: const Text(
                                    'Sign up',
                                    style: TextStyle(color: Colors.blue, fontSize: 20),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
