import 'package:covid_tracker/utilities/theme.dart';

import '/users_list/View/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  //Forcing app to run only in potrait
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
        title: 'Covid Tracker',
        debugShowCheckedModeBanner: false,

        // Adjusting various widget as per the scale factor of the display
        builder: (context, widget) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!);
        },
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,

        home: const SplashScreen(),
      ),
    );
  }
}
