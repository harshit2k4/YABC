import 'package:get/get.dart';

class GenderContoller extends GetxController {
  // control the switching of user gender (MALE or FEMALE)
  RxString rxGender = "MALE".obs;

  void handleGenderChange(String gender) {
    rxGender.value = gender;
  }
}
