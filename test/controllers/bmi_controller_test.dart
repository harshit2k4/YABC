import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:yabc/controllers/bmi_controller.dart';
import 'package:yabc/controllers/height_controller.dart';
import 'package:yabc/controllers/age_weight_controller.dart';
import 'package:yabc/controllers/gender_contoller.dart';

void main() {
  late BMIController bmiController;
  late HeightController heightController;
  late AgeWeightController ageWeightController;

  setUp(() {
    Get.testMode = true;
    heightController = Get.put(HeightController());
    ageWeightController = Get.put(AgeWeightController());
    Get.put(GenderContoller());
    bmiController = Get.put(BMIController());
  });

  tearDown(() {
    Get.reset();
  });

  group('BMIController - Bulletproof Logic Suite', () {
    test(
      'Stability: Repeated calculations with different data should not leak',
      () {
        // User 1: Normal (180cm, 75kg = 23.15)
        heightController.height.value = 180.0;
        ageWeightController.weight.value = 75;
        bmiController.calculateBMI();
        expect(bmiController.bmiStatus.value, "Normal");

        // User 2: Obese (150cm, 75kg = 33.33)
        heightController.height.value = 150.0;
        ageWeightController.weight.value = 75; // Changed from 90 to 75
        bmiController.calculateBMI();
        expect(bmiController.bmiStatus.value, "Obese");

        // User 3: Invalid (0 height)
        heightController.height.value = 0.0;
        bmiController.calculateBMI();
        expect(bmiController.bmi.value, "0.00");
        expect(bmiController.bmiStatus.value, "Invalid Input");
      },
    );

    test(
      'Precision: Should correctly round decimals as per UI requirements',
      () {
        heightController.height.value = 175.0;
        ageWeightController.weight.value = 70;
        bmiController.calculateBMI();
        expect(bmiController.bmi.value, "22.86");
      },
    );

    test(
      'Boundaries: Check exact transitions between all health categories',
      () {
        final Map<double, String> boundaries = {
          18.4: "Underweight",
          18.5: "Normal",
          24.9: "Normal",
          25.0: "Overweight",
          29.9: "Overweight",
          30.0: "Obese",
          34.9: "Obese",
          35.0: "Extreme Obese",
        };

        boundaries.forEach((bmiValue, expectedStatus) {
          bmiController.bmiVal.value = bmiValue;
          bmiController.checkStatus();
          expect(
            bmiController.bmiStatus.value,
            expectedStatus,
            reason: "Failed at BMI value: $bmiValue",
          );
        });
      },
    );

    test('Data Map Integrity: All statuses must map to existing content', () {
      final validStatuses = [
        "Underweight",
        "Normal",
        "Overweight",
        "Obese",
        "Extreme Obese",
      ];

      for (var status in validStatuses) {
        bmiController.bmiStatus.value = status;
        final summary = bmiController.getSummaryLine();
        final quote = bmiController.getQuote();

        expect(summary, isNot(contains("check your input data")));
        expect(summary.length, greaterThan(20));
        expect(quote, isNotEmpty);
      }
    });

    test('Reactivity: Obx/Listeners must be notified on calculation', () {
      bool wasNotified = false;
      ever(bmiController.bmi, (_) => wasNotified = true);

      heightController.height.value = 170.0;
      ageWeightController.weight.value = 60;
      bmiController.calculateBMI();

      expect(wasNotified, isTrue);
    });

    test(
      'Visual Stability: Correct hex colors must be assigned for health alerts',
      () {
        bmiController.bmiVal.value = 22.0;
        bmiController.checkStatus();
        expect(bmiController.colorStatus.value.value, 0xFF00CA39);

        bmiController.bmiVal.value = 45.0;
        bmiController.checkStatus();
        expect(bmiController.colorStatus.value.value, 0xFFE91E63);
      },
    );
  });
}
