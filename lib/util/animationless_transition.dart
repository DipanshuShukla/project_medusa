import 'package:flutter/material.dart';

class AnimationlessPageRoute extends MaterialPageRoute {
  AnimationlessPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
