import 'package:flutter/material.dart';
import 'package:project_medusa/auth/services/auth_google.dart';
import 'package:project_medusa/swiper/widgets/glass_tab_widget.dart';
import 'package:project_medusa/profile/widgets/info_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Icon(Icons.exit_to_app_outlined, size: 13),
        onPressed: () {
          final _provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          _provider.logout();
        },
        elevation: 10,
        backgroundColor: Colors.black26,
      ),
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
            children: const [
              // Container(
              //   height: _height * .08,
              //   child: const Center(
              //     child: Text(
              //       "Profile",
              //       style: TextStyle(
              //           color: Colors.white54,
              //           fontSize: 30,
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              UserInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
