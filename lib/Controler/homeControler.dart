
import 'dart:convert';

import 'package:get/get.dart';
import 'package:untitled1/Services/homeServices.dart';
import 'package:http/http.dart' as http;

import '../widget/user.dart';
class ControlHome extends GetxController{

  HomeControler services_home = HomeControler();

  List<ResponseModel> list = [];
  
  bool Loding = false;

  @override
  void onInit() {
    ResultData();
    super.onInit();
  }

  ResultData () async{

    http.Response result = await services_home.CountData();

    try{
      Loding = true;
      update();
      if (result.statusCode == 200){
        List<dynamic> DataList= jsonDecode(result.body);
        DataList.forEach((element) {
          list.add (ResponseModel.fromJson(element));
        });
        Loding = false;
      }
    } catch(value){
      print(value);
    }


  }




}