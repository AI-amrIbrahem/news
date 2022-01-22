import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/models/model/news_model.dart';
import 'package:news/moduls/business/business_screen.dart';
import 'package:news/moduls/science/science_screen.dart';
import 'package:news/moduls/setting/setting_screen.dart';
import 'package:news/moduls/sporsts/sports_screen.dart';
import 'package:news/network/repo/repo.dart';
import 'package:news/resourses/app_Strings.dart';
import 'package:news/resourses/constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> BottomNavigationBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business),label: AppStrings.business),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: AppStrings.sports),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: AppStrings.science),
    BottomNavigationBarItem(icon: Icon(Icons.settings),label: AppStrings.settings),
  ];

  void changePage(int value) {
    currentIndex = value;
    emit(ChangeBottomNavState());
  }

  List<Widget> screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingScreen()
  ];


  final Repo repo = Repo();

  Future<NewsModel> getNews({path,required category})async{
    return await repo.getNews(path: Constants.myUrl, query: {
      'country': Constants.country,
      'category': category,
      'apiKey': Constants.apiKey
    });
  }



}
