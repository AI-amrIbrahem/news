import 'package:flutter/material.dart';
import 'package:news/logic_states/home_cubit/home_cubit.dart';
import 'package:news/models/model/news_model.dart';
import 'package:news/resourses/constants.dart';
import 'package:news/widgets/item_of_list.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     var cubit = HomeCubit.get(context);
    return FutureBuilder(builder: (context,AsyncSnapshot<NewsModel> snapshot) {
      if (snapshot.data != null){
        return ListView.builder(
          itemCount: snapshot.data!.articles.length,
          itemBuilder: (context, index) {
            return getNewsItem(snapshot.data!.articles[index],context) ;
          },
        );

      }else
        return Center(child: CircularProgressIndicator());
    },future: cubit.getNews(category: Constants.sports),);
  }
}
