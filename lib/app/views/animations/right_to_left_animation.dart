import 'package:flutter/material.dart';

class BottomToTopAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double position;
  const BottomToTopAnimation({
    Key? key,
    required this.child,
    required this.duration,
    required this.position,
  }) : super(key: key);

  @override
  State<BottomToTopAnimation> createState() => _BottomToTopAnimationState();
}

class _BottomToTopAnimationState extends State<BottomToTopAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = Tween<Offset>(
            begin: Offset.zero,
            end: Offset(widget.position, 0)) //negative to go upwards
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: widget.position,
      child: widget.child,
    );
  }
}
