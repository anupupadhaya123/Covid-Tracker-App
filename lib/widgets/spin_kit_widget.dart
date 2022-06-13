import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinKitWidget extends StatelessWidget {
  const SpinKitWidget({
    Key? key,
    required AnimationController controller,
  }) : _controller = controller, super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child:Theme.of(context).brightness == Brightness.light ?  SpinKitFadingCircle(
        color: Colors.black,
        size: 50.h,
        controller: _controller,
      ) : SpinKitFadingCircle(
        color: Colors.white,
        size: 50.h,
        controller: _controller,
      ) ,
    );
  }
}
