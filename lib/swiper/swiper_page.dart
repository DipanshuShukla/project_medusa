import 'package:flutter/material.dart';
import 'package:project_medusa/chat/chat_page.dart';
import 'package:project_medusa/swiper/widgets/glass_tab_widget.dart';
import 'package:project_medusa/swiper/widgets/info_widget.dart';
import 'package:project_medusa/swiper/widgets/spotify_player_widget.dart';
import 'package:flip_card/flip_card.dart';
import 'package:project_medusa/util/animationless_transition.dart';
import 'package:project_medusa/util/new_page.dart';

class SwiperPage extends StatefulWidget {
  const SwiperPage({Key? key}) : super(key: key);

  @override
  State<SwiperPage> createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  bool _blankGlassTab = false;
  double AnimatedHeightmultiplier = .75;
  double AnimatedWidthmultiplier = .9;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  Future<void> startupFlip() async {
    await Future.delayed(Duration(milliseconds: 1200));
    cardKey.currentState?.toggleCard();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   startupFlip();
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Future<void> goToChat() async {
      // await Future.delayed(Duration(milliseconds: 200));
      cardKey.currentState?.toggleCard();
      //await Future.delayed(Duration(milliseconds: 500));
      setState(() {
        _blankGlassTab = true;
      });
      while (AnimatedHeightmultiplier != 1 || AnimatedWidthmultiplier != 1) {
        if (AnimatedHeightmultiplier < 1) {
          AnimatedHeightmultiplier += .011;
        } else {
          AnimatedHeightmultiplier = 1;
        }
        if (AnimatedWidthmultiplier < 1) {
          AnimatedWidthmultiplier += .004;
        } else {
          AnimatedWidthmultiplier = 1;
        }
        await Future.delayed(Duration(milliseconds: 26));
        setState(() {});
      }

      //await Future.delayed(Duration(milliseconds: 4000));
      setState(() {
        Navigator.of(context)
            .push(
                AnimationlessPageRoute(builder: (context) => const ChatPage()))
            .then((value) async {
          cardKey.currentState?.toggleCard();
          await Future.delayed(Duration(milliseconds: 700));

          Navigator.of(context)
              .push(AnimationlessPageRoute(builder: (context) => SwiperPage()));
        });
      });
    }

    return NewPage(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlipCard(
                key: cardKey,
                flipOnTouch: false,
                back: GlassTabWidget(
                  width: width * AnimatedWidthmultiplier,
                  height: height * AnimatedHeightmultiplier,
                ),
                front: GlassTabWidget(
                  width: width * .9,
                  height: height * .75,
                  children: [
                    InfoWidget(),
                    SpotifyPlayerWidget(),
                  ],
                ),
              ),
              if (_blankGlassTab == false) ...[
                IconButton(
                    onPressed: () {
                      goToChat();
                    },
                    icon: Icon(Icons.chat)),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
