import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    // User Info
    final user = FirebaseAuth.instance.currentUser;
    //String? _name = user!.displayName != null ? user.displayName : "Name";
    String _name = "Name";
    String _age = "Age";
    String _other_info = "Any other info related to the user\n\n"
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam at posuere purus. "
        "Vestibulum sit amet augue pellentesque libero placerat tincidunt. "
        "Donec interdum ligula quis risus ullamcorper posuere. Integer dignissim est ut semper porta. "
        "Pellentesque consequat vulputate porttitor. Ut feugiat metus eu ligula euismod ultrices. "
        "Fusce a sapien non orci posuere mattis. Mauris sed ipsum in tellus eleifend facilisis. "
        "Duis consequat imperdiet magna et consequat.\n\nMi eget mauris pharetra et ultrices neque. Purus in mollis nunc sed id semper.\n\n                                                          ......bleh, bleh-bleh!";

    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/woman-wearing-coat.jpg"),
          radius: _width * .275,
        ),

        //Avatar
        // ClipOval(
        //   child: Container(
        //     width: _width * .525,
        //     height: _width * .525,
        //     decoration: const BoxDecoration(
        //       image: DecorationImage(
        //         fit: BoxFit.cover,
        //         image: AssetImage("assets/images/woman-wearing-coat.jpg"),
        //       ),
        //     ),
        //   ),
        // ),

        SizedBox(
          height: _height * .02,
        ),

        //Song Title
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                //_name!,
                _name,
                style: TextStyle(
                    color: Colors.white60,
                    fontSize: _width * .06,
                    fontWeight: FontWeight.bold),
              ),
              Text(_age,
                  style: TextStyle(
                      color: Colors.white60,
                      fontSize: _width * .04,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: _height * .025,
              ),
              Container(
                width: _width * .7,
                height: _width * .5,
                child: SingleChildScrollView(
                  child: Text(
                    _other_info,
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: _width * .03,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
      ],
    );
  }
}
