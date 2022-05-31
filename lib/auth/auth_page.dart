import 'package:flutter/material.dart';
import 'package:project_medusa/auth/widgets/auth_buttons.dart';
import 'package:project_medusa/swiper/widgets/glass_tab_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.black, Colors.black87],
          ),
        ),
        child: Center(
          child: GlassTabWidget(
            width: _width * .9,
            height: _height * .75,
            children: [AuthButtons()],
          ),
        ),
      ),
    );
  }
}
