import 'package:covid_tracker/Utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 5.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: headingStyle.copyWith(fontSize: 15.r),
              ),
              Text(value, style: headingStyle.copyWith(fontSize: 15.r, fontWeight: FontWeight.normal))
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Divider()
        ],
      ),
    );
  }
}
