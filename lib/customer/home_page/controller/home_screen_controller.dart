import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../Firebase/firebase.dart';


class HomeScreenController extends GetxController{
  late String name;
  late String typeUser;
  late String typeStudent;
  Future<bool> fetchDataProfile() async {
    final user = await FirebaseAuth.instance.currentUser;
    if(user != null){
      await FirebaseController.fetchDataUser2(user);
      name=FirebaseController.name;
      typeUser=FirebaseController.typeUser;
      typeStudent=FirebaseController.typeStudent;
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