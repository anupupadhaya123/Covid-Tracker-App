import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utilities/constant.dart';
import '../users_list/View/countries_list_screen.dart';

class TrackCountryButton extends StatelessWidget {
  const TrackCountryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const CountriesListScreen()));
      },
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
            color: const Color(0xff1aa260),
            borderRadius:
                BorderRadius.circular(10)),
        child: Center(
          child: Text(
            'Track Countries',
            style: headingStyle.copyWith(
                fontSize: 18.r,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}