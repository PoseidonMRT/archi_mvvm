import 'package:flutter/cupertino.dart';

class PressedWidget extends StatefulWidget {
  final double opacity;
  final Widget child;
  final GestureTapCallback onTap;

  PressedWidget({this.opacity, this.child, this.onTap});

  @override
  _PressedWidgetState createState() {
    return _PressedWidgetState();
  }
}

class _PressedWidgetState extends State<PressedWidget> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Opacity(
        opacity: _isPressed ? widget.opacity : 1.0,
        child: widget.child,
      ),
    );
  }
}
