import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:yabc/ui/home_page.dart';
import 'package:yabc/controllers/age_weight_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() {
  setUp(() => Get.testMode = true);
  tearDown(() => Get.reset());

  testWidgets('HomePage: Stress Test - Tiny Screen & Counter Boundaries', (
    tester,
  ) async {
    // Ultra small screen
    await tester.binding.setSurfaceSize(const Size(320, 480));
    await tester.pumpWidget(const GetMaterialApp(home: HomePage()));

    // Verify no overflow occurred
    expect(tester.takeException(), isNull);

    // Test that Weight/Age cannot go negative in the UI
    final awCtrl = Get.find<AgeWeightController>();
    awCtrl.weight.value = 1; // Start at 1
    await tester.pump();

    final minusBtn = find.byIcon(Icons.remove).first;
    await tester.tap(minusBtn); // Should reach 0
    await tester.pump();
    expect(find.text("0"), findsOneWidget);

    await tester.tap(minusBtn); // Should not go to -1
    await tester.pump();
    expect(find.text("0"), findsOneWidget);
    expect(awCtrl.weight.value, 0);

    // Verify height slider is interactable
    expect(find.byType(SfSlider), findsOneWidget);
  });
}
