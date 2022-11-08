import 'package:flutter/material.dart';
import './client/client_signup.dart';
import './tradesman/tradesman_signup.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Registration",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),

      //BODY
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //HEADING TEXT
            const Text(
              'Getting\nStarted...',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w800,
              ),
            ),

            //VERTICAL SPACER
            const SizedBox(
              height: 30.0,
            ),

            //CONTAINER 1 / CLIENT SIGN UP LINK
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ClientSignup()));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Colors.black38, Colors.black]),
                  image: const DecorationImage(
                    image:
                        AssetImage("assets/images/getting_started_client.png"),
                    opacity: 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: 'I am a\n',
                        style: TextStyle(fontSize: 18.0, color: Colors.white)),
                    TextSpan(
                        text: 'Client',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                  ]),
                ),
              ),
            ),

            //VERTICAL SPACER
            const SizedBox(
              height: 30.0,
            ),

            //CONTAINER 2 / TRADESMAN SIGN UP LINK
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TradesmanSignup()));
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Colors.black38, Colors.black]),
                  image: const DecorationImage(
                    image: AssetImage(
                        "assets/images/getting_started_tradesman.png"),
                    opacity: 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: 'I am a\n',
                        style: TextStyle(fontSize: 18.0, color: Colors.white)),
                    TextSpan(
                        text: 'Tradesman',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
