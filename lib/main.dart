import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/resourses/app_colors.dart';

import 'layout/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color:AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.white,
            statusBarBrightness: Brightness.dark
          )
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
        )

      ),
      home: HomeLayout(),
    );
  }
}
