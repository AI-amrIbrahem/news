import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/moduls/business/business_screen.dart';
import 'package:news/moduls/science/science_screen.dart';
import 'package:news/moduls/sporsts/sports_screen.dart';
import 'package:news/resourses/app_Strings.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> BottomNavigationBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business),label: AppStrings.business),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: AppStrings.sports),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: AppStrings.science),
  ];

  void changePage(int value) {
    currentIndex = value;
    emit(ChangeBottomNavState());
  }

  List<Widget> screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
}
