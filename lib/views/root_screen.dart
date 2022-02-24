import 'package:codeclan/views/setting.dart';
import 'package:codeclan/views/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Something Went wrong !',
                  style: Theme.of(context).textTheme.headline3),
            );
          } else if (snapshot.hasData) {
            return const SettingPage();
          } else {
            return const SigninScreen();
          }
        },
      ),
    );
  }
}
