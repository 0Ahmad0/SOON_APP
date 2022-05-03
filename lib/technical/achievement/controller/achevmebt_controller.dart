import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/const_color.dart';

class AchivementTController extends GetxController{
  var index = 0.obs;
  Color buttonActive = mainColor;
  Color textButtonActive = Colors.white;
  List listReport=[].obs;
  var lateReport=false.obs;
  List? totalReports,accreditedReports,lateReports,closedReports,spoonReports,underProcedureReports;

  Future<bool> fetchDataReportUser() async {
    //========================================//
    try{
        await FirebaseFirestore.instance.collection("reports").
        get().
         then((value) => {
          totalReports=[].obs,
          accreditedReports=[].obs,
          lateReports=[].obs,
          closedReports=[].obs,
          spoonReports=[].obs,
          underProcedureReports=[],
          value.docs.forEach((element) {
            totalReports?.add(element);
            if(element["الحالة"]=="مغلقة")closedReports?.add(element.obs);
            else if(element["الحالة"]=="معتمدة")accreditedReports?.add(element.obs);
            else if(element["الحالة"]=="تحت الإجراء")underProcedureReports?.add(element.obs);
            if(element["الحالة"]=="معلقة")spoonReports?.add(element.obs);
            else if(element["الحالة"]!="مرفوضة"&&element["الحالة"]!="مغلقة"&&element["الجهة"]=="الفنيين"){
              if(Timestamp.now().compareTo(element["TimeFor"])==1){
                lateReports?.add(element.obs);
              }
            }
          }),
          listReport=totalReports!.obs,
          lateReport=false.obs,
          print("Closed Reports : "+"${closedReports?.length}"),
            print("Accredited Reports : "+"${accreditedReports?.length}"),
        print("Under Procedure Reports : "+"${underProcedureReports?.length}"),
        print("Spoon Reports : "+"${spoonReports?.length}"),
        print("Late Reports : "+"${lateReports?.length}"),
          print("Total Report : "+"${totalReports?.length}"),
        });
        return true;
    }catch(e){
      print(e);
      return false;
    }

  }
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