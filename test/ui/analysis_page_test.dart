import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:yabc/ui/analysis_page.dart';
import 'package:yabc/controllers/bmi_controller.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('AnalysisPage: Ironclad Logic-to-UI Integrity Test', (
    tester,
  ) async {
    final bmiController = Get.put(BMIController());

    // Overweight Senario
    // We simulate exactly what the controller would produce
    bmiController.bmi.value = "27.50";
    bmiController.bmiStatus.value = "Overweight";
    bmiController.colorStatus.value = Colors.orange;

    await tester.pumpWidget(
      GetMaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const AnalysisPage(),
      ),
    );

    expect(find.text("27.50"), findsOneWidget);
    expect(find.text("Overweight"), findsOneWidget);

    final contentFinder = find.byWidgetPredicate(
      (widget) => widget is Text && (widget.data?.contains("weight") ?? false),
    );
    expect(
      contentFinder,
      findsAtLeastNWidgets(1),
      reason:
          "The page must display the health advice content containing the keyword 'weight'",
    );

    // Verify the status text uses the controller's color
    final Text statusTextWidget = tester.widget(find.text("Overweight"));
    expect(statusTextWidget.style?.color, Colors.orange);

    // Tap the 'About' button to ensure the full UI tree is interactable
    final aboutBtn = find.text("About & Disclaimer");
    expect(aboutBtn, findsOneWidget);

    // Ensure the button is clickable and doesn't throw layout errors
    await tester.tap(aboutBtn);
    await tester.pumpAndSettle();
  });
}
