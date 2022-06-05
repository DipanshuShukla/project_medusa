import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewPage extends StatelessWidget {
  final Widget? child;
  final PreferredSizeWidget? appbar;

  const NewPage({Key? key, this.child = null, this.appbar = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appbar,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              //image: AssetImage("assets/images/lol.jpg"), fit: BoxFit.cover)
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/en/2/2e/Ed_Sheeran_-_Bad_Habits_2.png"),
              fit: BoxFit.cover),
        ),
        height: height,
        width: width,
        child: SafeArea(
          child: child!,
        ),
      ),
    );
  }
}
