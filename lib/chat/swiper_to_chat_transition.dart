import 'package:flutter/material.dart';
import 'package:project_medusa/swiper/widgets/glass_tab_widget.dart';

class SwiperToChatTransition extends StatefulWidget {
  const SwiperToChatTransition({Key? key}) : super(key: key);

  @override
  State<SwiperToChatTransition> createState() => _SwiperToChatTransitionState();
}

class _SwiperToChatTransitionState extends State<SwiperToChatTransition> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
          child: GlassTabWidget(
        width: _width * .9,
        height: _height * .75,
      )),
    );
  }
}
