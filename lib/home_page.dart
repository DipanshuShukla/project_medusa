import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_medusa/auth/auth_page.dart';
import 'package:project_medusa/profile/profile_page.dart';
import 'package:project_medusa/swiper/swiper_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, _response) {
            if (_response.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(color: Colors.redAccent));
            } else if (_response.hasData) {
              return ProfilePage();
            } else if (_response.hasError) {
              return Center(child: Text("Oops.. Something's wrong!"));
            } else {
              return AuthPage();
            }
          },
        ),
      );
}
