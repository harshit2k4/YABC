import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:yabc/widgets/height_selector.dart';
import 'package:yabc/controllers/height_controller.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(() {
    Get.reset();
  });

  Widget createTestWidget() {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: 600,
            width: 300,
            child: Column(children: [HeightSelector()]),
          ),
        ),
      ),
    );
  }

  group('HeightSelector - Stability Suite', () {
    testWidgets('Slider drag updates controller and internal slider state', (
      WidgetTester tester,
    ) async {
      final controller = Get.put(HeightController());
      controller.height.value = 100.0;

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Verify "Height" label (Static UI check)
      expect(find.text('Height'), findsOneWidget);

      // Verify Slider and check for its initial value
      final sliderFinder = find.byType(SfSlider);
      expect(sliderFinder, findsOneWidget);

      SfSlider sliderWidget = tester.widget(sliderFinder);
      expect(sliderWidget.value, 100.0);

      // Perform a vertical drag
      // Drag upwards (negative Y) to increase height
      await tester.drag(sliderFinder, const Offset(0.0, -200.0));

      // Wait for internal timers
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify controller updated
      expect(controller.height.value, greaterThan(100.0));

      // Verify Slider widget with its visual value
      // re-fetch widget to check new state
      sliderWidget = tester.widget(sliderFinder);
      expect(sliderWidget.value, greaterThan(100.0));
    });

    testWidgets('Clamping: Slider should respect internal 50-300 constraints', (
      WidgetTester tester,
    ) async {
      final controller = Get.put(HeightController());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final sliderFinder = find.byType(SfSlider);

      // Drag to extreme top (trying to go > 300)
      await tester.drag(sliderFinder, const Offset(0.0, -1000.0));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify via controller and widget properties
      expect(controller.height.value, 300.0);
      expect((tester.widget(sliderFinder) as SfSlider).value, 300.0);

      // Drag to extreme bottom (trying to go < 50)
      await tester.drag(sliderFinder, const Offset(0.0, 1000.0));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(controller.height.value, 50.0);
      expect((tester.widget(sliderFinder) as SfSlider).value, 50.0);
    });

    testWidgets('Check Visual Identity: Height label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Height'), findsOneWidget);
    });
  });
}
