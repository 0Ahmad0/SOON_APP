import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../Firebase/firebase.dart';

class HomeTController extends GetxController{
  late String name;
  late String typeUser;
  Future<bool> fetchDataProfile() async {
    final user = await FirebaseAuth.instance.currentUser;
    if(user != null){
      await FirebaseController.fetchDataUser2(user);
      name=FirebaseController.name;
      typeUser=FirebaseController.typeUser;
      return true;
    }else{
      print("user null");
      return false;
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    fetchDataProfile();
    super.onInit();
  }
}