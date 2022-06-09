import 'dart:async';
import 'dart:math' as math;

import 'package:covid_tracker/Utilities/constant.dart';
import 'package:covid_tracker/users_list/View/world_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WorldStates())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                child: Container(
                  width: 200.h,
                  height: 200.w,
                  child: const Center(
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage('images/virus.png'),
                    ),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                },
              ),
              SizedBox(
                height: 100.h,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Covid-19\nTracker App',
                    textAlign: TextAlign.center,
                    style: headingStyle,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
