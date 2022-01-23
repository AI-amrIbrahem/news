import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/prefrence/app_pref.dart';
import 'package:news/resourses/app_colors.dart';

import 'layout/home_layout.dart';
import 'logic_states/home_cubit/home_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is ChangeMode,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter News',
            theme: ThemeData(
                scaffoldBackgroundColor: AppColors.white,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                    backgroundColor: AppColors.white,
                    elevation: 0,
                    titleTextStyle: TextStyle(
                        color: AppColors.black,
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
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black
                    )
                )

            ),

            darkTheme: ThemeData(

              inputDecorationTheme: InputDecorationTheme(
                fillColor: Colors.white,
                hoverColor: Colors.deepOrange,
                focusColor: Colors.deepOrange,
              ),
                scaffoldBackgroundColor: AppColors.darkBackgroundColor,
                appBarTheme: AppBarTheme(
                    backgroundColor: AppColors.darkBackgroundColor,
                    elevation: 0,
                    titleTextStyle: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                    iconTheme: IconThemeData(
                        color: AppColors.white
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      systemStatusBarContrastEnforced: false,
                      statusBarIconBrightness: Brightness.light,
                      statusBarColor: AppColors.darkBackgroundColor,

                    )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    elevation: 20,
                    selectedItemColor: AppColors.selectItem,
                    backgroundColor: AppColors.darkBackgroundColor,
                    unselectedItemColor: Colors.grey
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white
                    )
                ),

            ),
            themeMode: HomeCubit
                .get(context)
                .mode,
            home: Directionality(
                textDirection: TextDirection.ltr, child: HomeLayout()),

          );
        },
      ),
    );
  }
}
