import 'dart:ui';

import 'package:get/get.dart';
import 'package:yabc/controllers/age_weight_controller.dart';
import 'package:yabc/controllers/gender_contoller.dart';
import 'package:yabc/controllers/height_controller.dart';
import 'package:yabc/data/bmi_content.dart';

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

    // Check for valid input before calculating
    if (heightInMeters <= 0 || ageWeightController.weight.value <= 0) {
      bmiVal.value = 0.0;
      bmi.value = "0.00";
    } else {
      // calculate BMI till 2 decimal places
      bmiVal.value =
          ageWeightController.weight.value / (heightInMeters * heightInMeters);
      bmi.value = bmiVal.toStringAsFixed(2);
      // convert back to double (optional, as bmiVal is already a double)
      bmiVal.value = double.parse(bmi.value);
    }
    checkStatus();
  }

  void checkStatus() {
    if (bmiVal.value < 18.5) {
      bmiStatus.value = "Underweight";
      // Dark Orange (High contrast on light and dark backgrounds)
      colorStatus.value = const Color(0xFFEF6C00);
    } else if (bmiVal.value >= 18.5 && bmiVal.value <= 24.9) {
      bmiStatus.value = "Normal";
      // Bright Green
      colorStatus.value = const Color(0xFF00CA39);
    } else if (bmiVal.value >= 25.0 && bmiVal.value <= 29.9) {
      bmiStatus.value = "Overweight";
      // Orange Peel (Distinct from Dark Orange and better contrast)
      colorStatus.value = const Color(0xFFF9A825);
    } else if (bmiVal.value >= 30.0 && bmiVal.value <= 34.9) {
      bmiStatus.value = "Obese";
      // Darker Red (Stronger contrast on light background)
      colorStatus.value = const Color(0xFFD32F2F);
    } else if (bmiVal.value >= 35.0) {
      bmiStatus.value = "Extreme Obese";
      // Deep Pink/Magenta (Highly visible on the Dark Theme's dark background)
      colorStatus.value = const Color(0xFFE91E63);
    } else {
      // Fallback for cases where bmiVal might be 0 or negative before calculation
      bmiStatus.value = "Invalid Input";
      colorStatus.value = const Color(0xFF246AFE); // Default primary blue
    }
  }

  /// Fetches the summary line (Line 2) based on the current BMI status.
  String getSummaryLine() {
    final status = bmiStatus.value;

    // Retrieve the summary from the map.
    final contentMap = bmiAnalysisContent[status];

    // Use null-aware operator (??) to provide a safe default message
    // if the status key is not found (e.g., "Invalid Input").
    return contentMap?["summary"] ??
        "Please check your input data to get a full body analysis.";
  }

  /// Fetches the motivational quote (Line 3) based on the current BMI status.
  String getQuote() {
    final status = bmiStatus.value;
    final contentMap = bmiAnalysisContent[status];

    return contentMap?["quote"] ??
        "“Health is a state of body, a state of mind, a state of life.”";
  }
}
