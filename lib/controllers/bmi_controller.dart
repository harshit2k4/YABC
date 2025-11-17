import 'dart:ui';

import 'package:get/get.dart';
import 'package:yabc/controllers/age_weight_controller.dart';
import 'package:yabc/controllers/gender_contoller.dart';
import 'package:yabc/controllers/height_controller.dart';

class BMIController extends GetxController {
  // init values;
  RxString bmi = "".obs;
  RxDouble bmiVal = 0.0.obs;
  RxString bmiStatus = "".obs;
  // color code for different BMI status
  Rx<Color> colorStatus = Color(0xFF246AFE).obs; // default color

  // get all controller values
  HeightController heightController = Get.put(HeightController());
  AgeWeightController ageWeightController = Get.put(AgeWeightController());
  GenderContoller genderContoller = Get.put(GenderContoller());

  void calculateBMI() {
    // convert height from centimeter to meter
    var heightInMeters = heightController.height.value / 100;

    // calculate BMI till 2 decimal places
    bmiVal.value =
        ageWeightController.weight.value / (heightInMeters * heightInMeters);
    bmi.value = bmiVal.toStringAsFixed(2);
    // convert back to double
    bmiVal.value = double.parse(bmi.value);
    checkStatus();
  }

  void checkStatus() {
    if (bmiVal.value < 18.50) {
      bmiStatus.value = "Underweight";
      // change color
      colorStatus.value = Color(0xFFFFB800);
    }
    if (bmiVal.value > 18.50 && bmiVal.value < 24.90) {
      bmiStatus.value = "Normal";
      colorStatus.value = Color(0xFF00CA39);
    }
    if (bmiVal.value > 25.00 && bmiVal.value < 29.90) {
      bmiStatus.value = "Overweight";
      colorStatus.value = Color(0xFFFF5858);
    }
    if (bmiVal.value > 30.00 && bmiVal.value < 34.90) {
      bmiStatus.value = "Obese";
      colorStatus.value = Color(0xFFFF0000);
    }
    if (bmiVal.value > 35.00) {
      bmiStatus.value = "Extreme Obese";
      colorStatus.value = Color(0xFF000000);
    }
  }
}
