import 'package:get/get.dart';
import 'package:yabc/controllers/age_weight_controller.dart';
import 'package:yabc/controllers/gender_contoller.dart';
import 'package:yabc/controllers/height_controller.dart';

class BMIController extends GetxController {
  // init values;
  RxString bmi = "".obs;
  RxDouble bmiVal = 0.0.obs;

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
  }
}
