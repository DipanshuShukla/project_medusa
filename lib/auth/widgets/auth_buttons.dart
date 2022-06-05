import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_medusa/services/facebook_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_medusa/services/google_sign_in.dart';

class AuthButtons extends StatefulWidget {
  final IconData icon = Icons.abc;
  final String method;
  final VoidCallback callback;
  const AuthButtons({Key? key, required this.method, required this.callback})
      : super(key: key);

  @override
  State<AuthButtons> createState() => _AuthButtonsState();
}

class _AuthButtonsState extends State<AuthButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 70,
        height: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: TextButton(
            onPressed: widget.callback,
            style: TextButton.styleFrom(backgroundColor: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Icon(widget.icon),
                ),
                Text("Sign In with ${widget.method}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthButtons(
      callback: () {
        final provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
        provider.googleLogin();
      },
      method: "Google",
    );
  }
}

class FacebookSignInButton extends StatelessWidget {
  const FacebookSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthButtons(
      callback: () {
        final provider =
            Provider.of<FacebookSignInProvider>(context, listen: false);
        provider.FacebookLogin();
      },
      method: "Facebook",
    );
  }
}

class PhoneSignInButton extends StatelessWidget {
  const PhoneSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthButtons(
      callback: () {},
      method: "your Phone Number",
    );
  }
}
