import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/network/remote/dio_helper.dart';
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
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.selectItem
        ),
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color:AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          iconTheme: IconThemeData(
             color: AppColors.black
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            systemStatusBarContrastEnforced: false,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: AppColors.white,

          )
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          selectedItemColor: AppColors.selectItem,
          backgroundColor: AppColors.white,
        )

      ),
      darkTheme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: AppBarTheme(
              backgroundColor: AppColors.white,
              elevation: 0,
              titleTextStyle: TextStyle(
                  color:AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
              iconTheme: IconThemeData(
                  color: AppColors.black
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                systemStatusBarContrastEnforced: false,
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: AppColors.white,

              )
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            elevation: 10,
            selectedItemColor: AppColors.selectItem,
            backgroundColor: AppColors.white,
          )

      ),
      themeMode: ThemeMode.light,
      home: HomeLayout(),
    );
  }
}
