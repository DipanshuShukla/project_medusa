import 'package:flutter/material.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: _width * .70,
            height: _width * .70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: Colors.white24,
                ),
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/en/2/2e/Ed_Sheeran_-_Bad_Habits_2.png"))),
          ),
        ),
        SizedBox(
          height: _height * .03,
        ),

        //Song Title
        Text("Bad Habbits",
            style: TextStyle(
                color: Colors.white,
                fontSize: _width * .06,
                fontWeight: FontWeight.bold)),

        SizedBox(
          height: _height * .01,
        ),

        //Song Artist
        Text("Ed Sheeran",
            style: TextStyle(
                color: Colors.white,
                fontSize: _width * .04,
                fontWeight: FontWeight.bold)),

        SizedBox(height: _height * .03)
      ],
    );
  }
}
