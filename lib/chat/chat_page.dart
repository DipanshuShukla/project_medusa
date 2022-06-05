import 'package:flutter/material.dart';
import 'package:project_medusa/swiper/widgets/glass_tab_widget.dart';
import 'package:project_medusa/util/new_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Future<void> goToSwiper() async {}

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return NewPage(
      appbar: AppBar(
        backgroundColor: Color(0x00000000),
        elevation: 0,
        title: Text(
          "Chat",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white.withOpacity(.55)),
        ),
      ),
      child: GlassTabWidget(
        height: _height,
        width: _width,
        noRoundedCorners: true,
        children: [
          Center(
              child: Text(
            "Lolicon Chat",
            style: TextStyle(
                fontSize: 40,
                color: Colors.white.withOpacity(.7),
                fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }
}
