import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FocusWrap extends StatefulWidget {
  final GestureTapCallback? onTap;
  final Widget child;

  const FocusWrap({
    required this.child,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  FocusWrapState createState() => FocusWrapState();
}

class FocusWrapState extends State<FocusWrap> {
  bool _isFocused = false;
  bool _isHovered = false;
  static const _focusDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onFocusChange: (value) => setState(() {
        _isFocused = value;
      }),
      onKey: (_, event) {
        if (widget.onTap != null && event.hasSubmitIntent) {
          widget.onTap!();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: MouseRegion(
        onHover: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: _focusDuration,
          child: AnimatedPhysicalModel(
            borderRadius: BorderRadius.circular(25),
            color: _isFocused ? Colors.blueGrey : Colors.blue,
            shape: BoxShape.rectangle,
            elevation: _isHovered ? 25 : 10,
            shadowColor: Colors.black,
            duration: _focusDuration,
            curve: Curves.fastOutSlowIn,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

extension SubmitAction on RawKeyEvent {
  bool get hasSubmitIntent =>
      this is RawKeyDownEvent &&
      (logicalKey == LogicalKeyboardKey.space || logicalKey == LogicalKeyboardKey.enter);
}
