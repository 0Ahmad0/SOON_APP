import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Firebase/firebase.dart';
import '../../../Firebase/reports.dart';
import '../../../const/const_color.dart';

class ChosenTechnicalDMController extends GetxController{
  Report report = Report();
  String searchFilter="";
  String beneficiaryFilter="";
  String headquartersFilter="";
  var listReport;
  var timeFrom = DateTime.now().obs;
  var timeTo = DateTime.now().obs;

  var selectedText = ''.obs;

  var index = 0.obs;
  Color buttonActive = mainColor;
  Color textButtonActive = Colors.white;
  String? textReply;
  var listReply;
  PageController? controllerPageView;


  Future<String> sendReply() async {
    listReply=FirebaseController.report["reply"];
    listReply.add({
      "Time":DateTime.now(),
      "email":FirebaseController.email,
      "الاسم":FirebaseController.name,
      "الحالة":FirebaseController.report["الحالة"],
      "الجهة":FirebaseController.report["الجهة المستفيدة"],
      "الوصف":"${textReply}",
    });
    print(FirebaseController.report.id);
    final send=await FirebaseFirestore.instance.collection("reports").doc(FirebaseController.report.id).update(
        {
          "reply":listReply,
        }).then((value){
      print("تم إضافة رد");
      return "تم إضافة رد";
    });
    if(send.isEmpty){
      print("لم يتم إضافة رد");
      return "لم يتم إضافة رد";
    }
    else{
      return "تم إضافة رد";
    }

  }

  Future<bool> fetchDataReportUser() async {
    String filter="";
    String? nameFilter;

    //==================================//
    if(beneficiaryFilter!=""){
      filter=beneficiaryFilter;
      nameFilter="الجهة المستفيدة";
    }
    else if(headquartersFilter!=""){
      filter=headquartersFilter;
      nameFilter="المقر";
    }
    else{
      filter="";
    }
    //========================================//
    try{
      if(searchFilter!=""&&filter!=""){
        await FirebaseFirestore.instance.collection("reports").
        where("رقم البلاغ",isEqualTo: searchFilter).
        //where("email",isEqualTo: FirebaseController.email).
       // where("الحالة",isEqualTo: "جديدة").

        where("${nameFilter}",isEqualTo: filter).
        get().
        then((value) => {
          listReport=[],
          value.docs.forEach((element) {
            ((element["الحالة"]=="جديدة"||element["الحالة"]=="معتمدة")&&element["نوع الحركة"]!="إحالة التذكرة لخدمة العملاء")?listReport.add(element):"";
          }),
          print("listReport : "+"${listReport.length}"),
        });
        return true;
      }
      else if(searchFilter!=""&&filter==""){
        await FirebaseFirestore.instance.collection("reports").

        //where("email",isEqualTo: FirebaseController.email).
        where("رقم البلاغ",isEqualTo: searchFilter).
       // where("الحالة",isEqualTo: "جديدة").
        get().
        then((value) => {
          listReport=[],
          value.docs.forEach((element) {
            ((element["الحالة"]=="جديدة"||element["الحالة"]=="معتمدة")&&element["نوع الحركة"]!="إحالة التذكرة لخدمة العملاء")?listReport.add(element):"";
          }),
          print("listReport : "+"${listReport.length}"),
        });
        return true;
      }
      else if(searchFilter==""&&filter!=""){
        await FirebaseFirestore.instance.collection("reports").
       // where("الحالة",isEqualTo: "جديدة").
        //where("email",isEqualTo: FirebaseController.email).
        where("${nameFilter}",isEqualTo: filter).
        get().
        then((value) => {
          listReport=[],
          value.docs.forEach((element) {
            ((element["الحالة"]=="جديدة"||element["الحالة"]=="معتمدة")&&element["نوع الحركة"]!="إحالة التذكرة لخدمة العملاء")?listReport.add(element):"";
          }),
          print("listReport : "+"${listReport.length}"),
        });
        return true;
      }
      else{
        await FirebaseFirestore.instance.collection("reports").
        //where("الحالة",isEqualTo: "جديدة").
        get().
        then((value) => {
          listReport=[],
          value.docs.forEach((element) {
            ((element["الحالة"]=="جديدة"||element["الحالة"]=="معتمدة")&&element["نوع الحركة"]!="إحالة التذكرة لخدمة العملاء")?listReport.add(element):"";
          }),
          print("listReport : "+"${listReport.length}"),
        });
        return true;
      }
    }catch(e){
      print(e);
      return false;
    }

  }
  bool checkChosenTechnicians(var report) {
    if (report["الحالة"] == "جديدة" &&
        (report["نوع الحركة"] == "" || report["tracking"].length == 0))
      return false;
    else if (report["الحالة"] == "معتمدة" && report["نوع الحركة"] ==
        "إحالة التذكرة لمركز الصيانة" && report["tracking"].length == 2)
      return false;
    else
      return true;
  }
  @override
  void onInit() {
    controllerPageView = PageController(
        initialPage: 0
    );
    fetchDataReportUser();
    super.onInit();
  }
  void onClickButton(val){
    index.value = val;
    print(index);
  }
}