import 'package:flutter/material.dart';
import './signup.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //BACKGROUND IMAGE
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/startup.png"),
            // opacity: 0.1,
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(149, 0, 0, 0)
                ]),
          ),
        ),
      ),

      //TEXT COLUMN
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),

              //LARGE TEXT
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Find a\n",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w300,
                        height: 1.3
                        // decoration: TextDecoration.none
                        ),
                  ),
                  TextSpan(
                    text: "Skilled Worker!",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 214, 10),
                        fontSize: 45,
                        fontWeight: FontWeight.w700,
                        height: 1.3
                        // decoration: TextDecoration.none
                        ),
                  ),
                ]),
              ),
            ),

            //VERTICAL SPACER
            const SizedBox(
              height: 30.0,
            ),

            //SMALL TEXT
            RichText(
              text: const TextSpan(children: [
                TextSpan(
                  text: "Let's make your next great hire ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.3,
                      decoration: TextDecoration.none),
                ),
                TextSpan(
                  text: "Fast.",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.none),
                ),
              ]),
            ),
          ],
        ),
      ),

      //BUTTONS ROW
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //LOGIN BUTTON
            Expanded(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30))),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ),

            //HORIZONTAL SPACER
            const SizedBox(
              width: 10.0,
            ),

            //SIGNUP BUTTON
            Expanded(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD600),
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(30))),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            )
          ]),
        ],
      )
    ]);
  }
}
