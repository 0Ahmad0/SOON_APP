import 'package:get/get.dart';

class NewReportCSController extends GetxController{
  var timeFrom = DateTime.now().obs;
  var timeTo = DateTime.now().obs;

  var selectedText = ''.obs;
}