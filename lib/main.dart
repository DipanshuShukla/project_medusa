import 'package:flutter/material.dart';
import 'package:project_medusa/home_view_controller.dart';
import 'package:project_medusa/services/facebook_sign_in.dart';
import 'package:project_medusa/services/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:project_medusa/auth/auth_page.dart';
import 'package:project_medusa/swiper/swiper_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => FacebookSignInProvider())
      ],
      child: MaterialApp(
        title: 'Project Medusa',
        home: HomeViewController(),
      ),
    );
  }
}
