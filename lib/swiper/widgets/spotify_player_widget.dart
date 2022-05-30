import 'package:flutter/material.dart';

class SpotifyPlayerWidget extends StatefulWidget {
  const SpotifyPlayerWidget({Key? key}) : super(key: key);

  @override
  State<SpotifyPlayerWidget> createState() => _SpotifyPlayerWidgetState();
}

class _SpotifyPlayerWidgetState extends State<SpotifyPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        color: Color.fromRGBO(30, 216, 96, 1),
        height: _height * .06,
        width: _width * .7,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image(
                  image: NetworkImage(
                      "https://storage.googleapis.com/pr-newsroom-wp/1/2018/11/Spotify_Logo_RGB_White.png")),
            )
          ],
        ),
      ),
    );
  }
}
