import 'package:flutter/material.dart';
import 'package:project_medusa/swiper/widgets/glass_tab_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  double AnimatedHeightMultiplier = 1;
  double AnimatedWidthMultiplier = 1;

  Future<void> goToSwiper() async {}

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
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
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/en/2/2e/Ed_Sheeran_-_Bad_Habits_2.png"))),
        child: GlassTabWidget(
          height: _height * AnimatedHeightMultiplier,
          width: _width * AnimatedWidthMultiplier,
          withoutCurve: true,
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
      ),
    );
  }
}
