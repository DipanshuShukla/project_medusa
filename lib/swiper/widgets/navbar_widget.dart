import 'package:flutter/material.dart';
import 'package:project_medusa/chat/chat_page.dart';
import 'package:project_medusa/profile/profile_page.dart';
import 'package:project_medusa/swiper/swiper_page.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int _index = 1;
  final _pages = [
    const ProfilePage(),
    const SwiperPage(),
    const ChatPage(),
  ];
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.black54,
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white70),
        ),
      ),
      child: NavigationBar(
        height: _height * .07,
        selectedIndex: _index,
        onDestinationSelected: (_index) => setState(() => this._index = _index),
        elevation: 15,
        backgroundColor: Colors.transparent,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.person, color: Colors.white), label: "Profile"),
          NavigationDestination(
              icon: Icon(Icons.home, color: Colors.white), label: "Rhytm"),
          NavigationDestination(
              icon: Icon(Icons.chat_bubble, color: Colors.white),
              label: "Chat"),
        ],
      ),
    );
  }
}
