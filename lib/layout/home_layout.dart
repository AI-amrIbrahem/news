import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/logic_states/home_cubit/home_cubit.dart';
import 'package:news/models/response/response_model.dart';
import 'package:news/moduls/search/search_screen.dart';
import 'package:news/network/remote/dio_helper.dart';
import 'package:news/network/repo/repo.dart';
import 'package:news/resourses/app_Strings.dart';
import 'package:news/resourses/app_colors.dart';
import 'package:news/resourses/constants.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          print(5);
          return Scaffold(

            appBar: AppBar(
              title: Text(AppStrings.t1),
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const SearchScreen()));
                }, icon: Icon(Icons.search)),
                IconButton(onPressed: (){
                  homeCubit.changeMode();
                }, icon: Icon(Icons.brightness_4_outlined)),
              ],
            ),

            body: homeCubit.screens[homeCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:homeCubit.currentIndex,
              onTap: (value) {
                homeCubit.changePage(value);
              },
              items: homeCubit.BottomNavigationBarItems,
            ),
          );
        },
      );
  }
}
