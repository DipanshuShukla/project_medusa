import 'package:flutter/material.dart';
import 'package:project_medusa/auth/services/auth_google.dart';
import 'package:provider/provider.dart';

class AuthButtons extends StatefulWidget {
  const AuthButtons({Key? key}) : super(key: key);

  @override
  State<AuthButtons> createState() => _AuthButtonsState();
}

class _AuthButtonsState extends State<AuthButtons> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Center(
      child: SizedBox(
        height: _height * .06,
        width: _width * .70,
        child: ElevatedButton(
          child: Text(
            "Sign in with Google",
            style: TextStyle(fontSize: _height * .017),
          ),
          onPressed: () {
            final _provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            _provider.googleLogin();
          },
        ),
      ),
    );
  }
}
