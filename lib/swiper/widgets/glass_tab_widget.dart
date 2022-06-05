import 'package:flutter/material.dart';
import 'dart:ui';

class GlassTabWidget extends StatefulWidget {
  final double width, height;
  final List<Widget> children;
  final bool noRoundedCorners;
  const GlassTabWidget(
      {Key? key,
      required this.width,
      required this.height,
      this.children = const [],
      this.noRoundedCorners = false})
      : super(key: key);

  @override
  State<GlassTabWidget> createState() => _GlassTabWidgetState();
}

class _GlassTabWidgetState extends State<GlassTabWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.noRoundedCorners ? 0 : 16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Stack(
          children: [
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.1),
                  borderRadius:
                      BorderRadius.circular(widget.noRoundedCorners ? 0 : 16),
                  border: Border.all(width: 2.2, color: Colors.white30)),
            ),
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.6),
                  borderRadius:
                      BorderRadius.circular(widget.noRoundedCorners ? 0 : 16),
                  border: Border.all(width: 2.2, color: Colors.black26)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
