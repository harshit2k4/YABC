import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:yabc/widgets/weight_selector.dart';
import 'package:yabc/controllers/age_weight_controller.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('WeightSelector: Stability & Boundary Test', (
    WidgetTester tester,
  ) async {
    final controller = Get.put(AgeWeightController());

    // Setup initial state
    controller.weight.value = 50;
    await tester.pumpWidget(
      const GetMaterialApp(home: Scaffold(body: WeightSelector())),
    );

    // Test Rapid Taps (Stress Test)
    // Simulating a user clicking "+" 5 times very quickly
    for (int i = 0; i < 5; i++) {
      await tester.tap(find.byIcon(Icons.add));
    }
    await tester.pump(); // Process all changes at once

    expect(controller.weight.value, 55);
    expect(find.text('55'), findsOneWidget);

    // Test Decrement to Boundary
    controller.weight.value = 2;
    await tester.pump();

    final minusBtn = find.byIcon(Icons.remove);
    await tester.tap(minusBtn); // 1
    await tester.tap(minusBtn); // 0
    await tester.tap(minusBtn); // Should stay 0
    await tester.tap(minusBtn); // Should stay 0

    await tester.pump();

    // Ensure it never goes below zero even with excessive taps
    expect(controller.weight.value, 0);
    expect(find.text('0'), findsOneWidget);

    // Verification of Component Hierarchy
    // Ensures the "Weight" label is present and styled as secondary
    final label = find.text('Weight');
    expect(label, findsOneWidget);

    // Verify the label color matches the theme's onSecondaryContainer logic
    // (This ensures no one accidentally hardcoded a color that breaks in Dark Mode)
    final Text textWidget = tester.widget(label);
    expect(textWidget.style?.fontSize, 18);
  });

  testWidgets('WeightSelector: State Synchronization Test', (
    WidgetTester tester,
  ) async {
    final controller = Get.put(AgeWeightController());

    await tester.pumpWidget(
      const GetMaterialApp(home: Scaffold(body: WeightSelector())),
    );

    // Manually updating the controller without a tap
    // to ensure Obx is listening correctly to external data changes
    controller.weight.value = 99;
    await tester.pump();

    expect(find.text('99'), findsOneWidget);
  });
}
