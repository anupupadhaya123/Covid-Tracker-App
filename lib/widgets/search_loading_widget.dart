import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

ListView SearchLoadingWidget() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade700,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Column(
          children: [
            ListTile(
              leading: Container(
                height: 50.h,
                width: 50.w,
                color: Colors.white,
              ),
              title: Container(
                width: 100.w,
                height: 8.h,
                color: Colors.white,
              ),
              subtitle: Container(
                width: double.infinity,
                height: 8.h,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    },
  );
}
