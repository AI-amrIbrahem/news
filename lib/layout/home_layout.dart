import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/logic_states/home_cubit/home_cubit.dart';
import 'package:news/models/response/response_model.dart';
import 'package:news/network/remote/dio_helper.dart';
import 'package:news/network/repo/repo.dart';
import 'package:news/resourses/app_Strings.dart';
import 'package:news/resourses/app_colors.dart';
import 'package:news/resourses/constants.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(AppStrings.t1),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                )
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
      ),
    );
  }
}
