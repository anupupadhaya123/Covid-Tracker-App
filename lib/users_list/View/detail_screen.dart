import 'dart:core';

import '/utilities/constant.dart';
import '/components/reusable_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  // ignore: use_key_in_widget_constructors
  const DetailScreen({
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? bgColor
            : greyColor,
        iconTheme: Theme.of(context).brightness == Brightness.light
            ? const IconThemeData(color: Colors.black)
            : const IconThemeData(color: Colors.white),
        title: Theme.of(context).brightness == Brightness.light
            ? Text(
                widget.name,
                style: headingStyle.copyWith(color: Colors.black),
              )
            : Text(
                widget.name,
                style: headingStyle.copyWith(color: Colors.white),
              ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        ReusableRow(
                          title: 'Cases',
                          value: widget.totalCases.toString(),
                        ),
                        ReusableRow(
                          title: 'Recovered',
                          value: widget.totalRecovered.toString(),
                        ),
                        ReusableRow(
                          title: 'Death',
                          value: widget.totalDeaths.toString(),
                        ),
                        ReusableRow(
                          title: 'Critical',
                          value: widget.critical.toString(),
                        ),
                        ReusableRow(
                          title: 'Today Recovered',
                          value: widget.totalRecovered.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    radius: 40.r,
                    backgroundImage: NetworkImage(
                      widget.image,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
