import 'package:flutter/material.dart';

class ShimmerPulse extends StatefulWidget {
  final Widget child;
  const ShimmerPulse(this.child, {super.key});
  @override
  State<StatefulWidget> createState() {
    return _ShimmerPulseState();
  }
}

class _ShimmerPulseState extends State<ShimmerPulse>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  final Duration _pulseAnimationDuration = const Duration(seconds: 1);
  final double _initialOpacity = 1.0;
  final double _finalOpacity = 0.4;

  @override
  void initState() {
    super.initState();
    _configurePulseAnimation();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _configurePulseAnimation() {
    _fadeController =
        AnimationController(vsync: this, duration: _pulseAnimationDuration);
    _fadeAnimation = Tween(begin: _initialOpacity, end: _finalOpacity).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.linear,
      ),
    );
    _fadeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fadeController.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        _fadeController.forward();
      }
    });
    _fadeController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: widget.child,
    );
  }
}
