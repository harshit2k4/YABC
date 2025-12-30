import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:yabc/widgets/age_selector.dart';
import 'package:yabc/controllers/age_weight_controller.dart';
import 'package:yabc/controllers/bmi_controller.dart';
import 'package:yabc/controllers/gender_contoller.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    // Inject dependencies required for the widget to build/init
    Get.put(GenderContoller());
    Get.put(BMIController());
  });

  tearDown(() {
    Get.reset();
  });

  group('AgeSelector - Maximum Stability Suite', () {
    testWidgets('Age cannot be decremented below zero (Boundary Lockdown)', (
      WidgetTester tester,
    ) async {
      final controller = Get.put(AgeWeightController());
      controller.age.value = 1;

      await tester.pumpWidget(
        const GetMaterialApp(home: Scaffold(body: AgeSelector())),
      );

      final minusBtn = find.byIcon(Icons.remove);

      await tester.tap(minusBtn);
      await tester.pump();
      expect(controller.age.value, 0);

      for (int i = 0; i < 50; i++) {
        await tester.tap(minusBtn);
      }
      await tester.pump();

      expect(controller.age.value, 0);
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('Tapping Age buttons does NOT modify Weight state', (
      WidgetTester tester,
    ) async {
      final controller = Get.put(AgeWeightController());
      controller.age.value = 25;
      controller.weight.value = 75; // Initial weight set to 75

      await tester.pumpWidget(
        const GetMaterialApp(home: Scaffold(body: AgeSelector())),
      );

      // Interact with Age increment button
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify Age changed
      expect(controller.age.value, 26);

      // Verify Weight stayed exactly at 75 (Bulletproof check)
      expect(
        controller.weight.value,
        75,
        reason: "Weight was modified when it should have remained 75",
      );
    });

    testWidgets('Visual Consistency: AGE label matches design system', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const GetMaterialApp(home: Scaffold(body: AgeSelector())),
      );

      final label = find.text('AGE');
      final Text textWidget = tester.widget(label);

      expect(textWidget.style?.fontSize, 18);
      // Verify color from theme
      final context = tester.element(find.byType(AgeSelector));
      expect(
        textWidget.style?.color,
        Theme.of(context).colorScheme.onSecondaryContainer,
      );
    });
  });
}
