import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LogoWidget extends StatelessWidget {
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: FlutterLogo(),
  );
}

class GrowTransition extends StatelessWidget {
  GrowTransition({
    required this.child,
    required this.animation
});
  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
        height: animation.value,
        width: animation.value,
        child: child,
      ),
      child: child,
    ),
  );
}

class AnimationRoute extends StatefulWidget {
  const AnimationRoute();

  @override
  _AnimationRouteState createState() => _AnimationRouteState();
}

class _AnimationRouteState extends State<AnimationRoute>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..addStatusListener((status) {
        print('$status');
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    GrowTransition growTransition = GrowTransition(
      child: LogoWidget(),
      animation: animation,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Route"),
      ),
      body: growTransition,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
