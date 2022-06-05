import 'package:flutter/material.dart';
import 'package:project_medusa/auth/widgets/auth_buttons.dart';
import 'package:project_medusa/swiper/widgets/glass_tab_widget.dart';
import 'package:project_medusa/util/new_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return NewPage(
      child: GlassTabWidget(
        noRoundedCorners: true,
        height: height,
        width: width,
        children: [
          Spacer(),
          GoogleSignInButton(),
          FacebookSignInButton(),
          AuthButtons(
            method: "Phone Number",
            callback: () {},
          )
        ],
      ),
    );
  }
}
