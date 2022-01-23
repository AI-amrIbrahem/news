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
import 'package:news/prefrence/app_pref.dart';
import 'package:news/resourses/app_Strings.dart';
import 'package:news/resourses/constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
   var mode = CashHelper.getMode() ? ThemeMode.dark:ThemeMode.light;


  void changeMode(){
    if (mode == ThemeMode.dark) {
      mode = ThemeMode.light;
      CashHelper.putMode(false);
    } else {
      mode =  ThemeMode.dark;
      CashHelper.putMode(true);
    }
    emit(ChangeMode());
  }

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

  NewsModel? sports ,science,business;

  Future<NewsModel> getNews({path,required category})async{
    if(category==Constants.sports){
      print(1);
      if(sports == null){
        sports =  await repo.getNews(path: Constants.myUrl, query: {
          'country': Constants.country,
          'category': category,
          'apiKey': Constants.apiKey
        });
      }
      print(3);
      return sports!;
    }else if(category==Constants.science){
      if(science==null){
        science = await repo.getNews(path: Constants.myUrl, query: {
          'country': Constants.country,
          'category': category,
          'apiKey': Constants.apiKey
        });
      }
      return science!;
    }else if(category==Constants.business){
      if(business==null){
        business = await repo.getNews(path: Constants.myUrl, query: {
          'country': Constants.country,
          'category': category,
          'apiKey': Constants.apiKey
        });
      }
      return business!;
    }
    else
      return  await repo.getNews(path: Constants.myUrl, query: {
      'country': Constants.country,
      'category': category,
      'apiKey': Constants.apiKey
    });
  }
}
