
import 'package:dio/dio.dart';
import 'package:news/resourses/constants.dart';

class DioHelper{
  static late Dio dio;

  static final DioHelper _instance = DioHelper.internal();

  factory DioHelper(){
   return  _instance;
  }

  DioHelper.internal(){
    createDio();
  }

  void createDio(){
    dio = Dio(
        BaseOptions(
            baseUrl:Constants.baseUrl,
            receiveDataWhenStatusError: true
        )
    );
  }

  Future<Response> getData({required path,required query})async{
    return await dio.get(path,queryParameters: query);
  }


}