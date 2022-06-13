import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppUrl {

  // this is our base url
  static const String baseUrl = 'https://disease.sh/v3/covid-19/' ;

  // fetch world covid states
  static const String worldStatesApi = baseUrl + 'all' ;
  static const String countriesList = baseUrl + 'countries' ;

}

// Constant color of piechart used in world_state.dart page
 const colorList =  <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),

  ];


// For Screen_utils packages

const bgColor = Color(0xFFEDEEF1);
const greyColor = Color(0xFF3A3A3A);

final headingStyle = TextStyle(
  fontSize: 24.r,
  letterSpacing: 0.4,
  fontWeight: FontWeight.w800,
);