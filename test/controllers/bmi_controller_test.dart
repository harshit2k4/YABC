import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:yabc/controllers/bmi_controller.dart';
import 'package:yabc/controllers/height_controller.dart';
import 'package:yabc/controllers/age_weight_controller.dart';

void main() {
  late BMIController bmiController;
  late HeightController heightController;
  late AgeWeightController ageWeightController;

  // Runs before every test
  setUp(() {
    Get.testMode = true; // Required for GetX testing
    heightController = Get.put(HeightController());
    ageWeightController = Get.put(AgeWeightController());
    bmiController = Get.put(BMIController());
  });

  // Runs after every test to clean up memory
  tearDown(() => Get.reset());

  test('Calculate BMI: 180cm and 70kg should result in 21.60', () {
    // Arrange
    heightController.height.value = 180.0;
    ageWeightController.weight.value = 70;

    // Act
    bmiController.calculateBMI();

    // Assert
    expect(bmiController.bmi.value, "21.60");
    expect(bmiController.bmiStatus.value, "Normal");
  });
}
