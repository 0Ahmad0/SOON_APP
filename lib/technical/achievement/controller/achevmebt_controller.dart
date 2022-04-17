import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/const_color.dart';

class AchivementTController extends GetxController{
  var index = 0.obs;
  Color buttonActive = mainColor;
  Color textButtonActive = Colors.white;
  void onClickButton(val){
    index.value = val;
    print(index);
  }

  var selectName = 'عبدالعزيز الأحمدي'.obs;
  List customerNames = [
    'أحمد متولي',
    'رهف متولي',
    'شهد العامودي',
    'رزان الحربي',
    'ايمان الأهدل',
  ];
}