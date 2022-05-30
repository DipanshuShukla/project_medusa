import 'package:flutter/material.dart';
import 'package:project_medusa/swiper/swiper_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: SwiperPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final Duration _duration = Duration(milliseconds: 320);
  late AnimationController _controller =
      AnimationController(vsync: this, duration: _duration);
  late Animation<Offset> _offsetAnimationDislike = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(-1, 0.0),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

  late Animation<Offset> _offsetAnimationLike = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(1, 0.0),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

  double _opacity = 1;
  double _buttonId = 1;

  Future<void> next(double buttonId) async {
    ;
    setState(() {
      _buttonId = buttonId;
      _controller.forward();
      _opacity = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/lol.jpg"), fit: BoxFit.fill)),
        height: _height,
        width: _width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _height * 0.75,
              width: _width * 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.black54),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(.6),
                            Colors.black.withOpacity(.6)
                          ],
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedOpacity(
                        opacity: _opacity,
                        duration: _duration,
                        child: SlideTransition(
                          position: _buttonId == 0
                              ? _offsetAnimationDislike
                              : _offsetAnimationLike,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              height: _width * .65,
                              width: _width * .65,
                              child: Image.network(
                                  "https://upload.wikimedia.org/wikipedia/en/2/2e/Ed_Sheeran_-_Bad_Habits_2.png"),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: _width * .55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: _height * .03,
                            ),
                            AnimatedOpacity(
                              opacity: _opacity,
                              duration: Duration(milliseconds: 250),
                              child: SlideTransition(
                                position: _buttonId == 0
                                    ? _offsetAnimationDislike
                                    : _offsetAnimationLike,
                                child: Text(
                                  "Bad Habbits",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.85),
                                      fontSize: _width * .06,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _height * .01,
                            ),
                            AnimatedOpacity(
                              opacity: _opacity,
                              duration: Duration(milliseconds: 225),
                              child: SlideTransition(
                                position: _buttonId == 0
                                    ? _offsetAnimationDislike
                                    : _offsetAnimationLike,
                                child: Text("Ed Sheeran",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(.8),
                                        fontSize: _width * .04,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _height * .03,
                      ),
                      SizedBox(
                        height: _height * 0.075,
                        width: _width * .65,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/spt.png")),
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                                height: _height * .07,
                                width: _width * .25,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.3)),
                                child: IconButton(
                                  icon: Icon(Icons.heart_broken, size: 34),
                                  onPressed: () {
                                    next(0);
                                  },
                                  color: Colors.white,
                                )),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                                height: _height * .07,
                                width: _width * .25,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.3)),
                                child: IconButton(
                                  onPressed: () => next(1),
                                  icon: Icon(
                                    Icons.favorite,
                                    size: 34,
                                    color: Colors.white,
                                  ),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
