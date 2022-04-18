import 'package:get/get.dart';

class ChosenTechnicalForTicketDMController extends GetxController{
  var timeFrom = DateTime.now().obs;
  var timeTo = DateTime.now().obs;


  var technicalName = ''.obs;
  var  helperTechnical = ''.obs;

  var expectedTime1 = DateTime.now().obs;
  var expectedTime2 = DateTime.now().obs;

  var dayTime = 0.obs;

  void changeDayTime(index){
    index == 0? dayTime.value =0:dayTime.value=1;
  }
}