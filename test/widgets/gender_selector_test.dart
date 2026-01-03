import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:yabc/ui/home_page.dart';
import 'package:yabc/controllers/gender_contoller.dart';
import 'package:yabc/widgets/primary_button.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(() {
    Get.reset();
  });

  // Simulate real phone screen size
  Future<void> setSurfaceSize(WidgetTester tester, Size size) async {
    await tester.binding.setSurfaceSize(size);
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1.0;
  }

  testWidgets('Gender Selector: Tap updates Controller and Visual State', (
    WidgetTester tester,
  ) async {
    // set screen size (this avoids RenderFlex overflow)
    await setSurfaceSize(tester, const Size(1080, 1920));

    final genderController = Get.put(GenderContoller());

    // Pump the HomePage
    await tester.pumpWidget(const GetMaterialApp(home: HomePage()));

    // Verify Initial State
    expect(genderController.rxGender.value, "MALE");

    final maleBtn = find.widgetWithText(PrimaryButton, "MALE");
    final femaleBtn = find.widgetWithText(PrimaryButton, "FEMALE");

    // Verify "MALE" is visually active (Uses Primary color)
    final Container maleContainer = tester.widget<Container>(
      find.descendant(of: maleBtn, matching: find.byType(Container)).first,
    );
    final BoxDecoration maleDeco = maleContainer.decoration as BoxDecoration;
    final Color activeColor = Theme.of(
      tester.element(maleBtn),
    ).colorScheme.primary;

    expect(maleDeco.color, activeColor);

    // Interact: Tap FEMALE
    await tester.tap(femaleBtn);
    await tester.pumpAndSettle();

    // Verify Logic Update
    expect(genderController.rxGender.value, "FEMALE");

    // Verify Visual Switch
    final Container femaleContainer = tester.widget<Container>(
      find.descendant(of: femaleBtn, matching: find.byType(Container)).first,
    );
    final BoxDecoration femaleDeco =
        femaleContainer.decoration as BoxDecoration;
    expect(femaleDeco.color, activeColor);
  });
}
