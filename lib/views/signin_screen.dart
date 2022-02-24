import 'package:codeclan/providers/google_signin_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'root_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xFF08C25D),
              width: double.infinity,
              child: Image.asset('images/splash-screen.jpg'),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            height: 100.0,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome 👋',
                  style: TextStyle(
                      fontFamily: 'Arial Rounde',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                ),
                SizedBox(height: 10.0),
                Text(
                  'if You are already have Gocery account, enter your email below',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Arial Rounde',
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () async {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
            icon: SizedBox(
              height: 50.0,
              width: 50.0,
              child: Image.asset('images/google-icon.png'),
            ),
            backgroundColor: const Color.fromRGBO(248, 245, 245, 1),
            label: const Text(
              'Sing in with Google',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
