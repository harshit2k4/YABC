import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:yabc/ui/about_page.dart';

void main() {
  setUp(() => Get.testMode = true);
  tearDown(() => Get.reset());

  testWidgets('AboutPage: Deep Scroll & State Pop Test', (tester) async {
    // 1. SETUP: Start with a Dummy Root Page
    // We cannot test 'Get.back()' if AboutPage is the only thing on the stack.
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: TextButton(
            onPressed: () => Get.to(() => const AboutPage()),
            child: const Text("Open About"),
          ),
        ),
      ),
    );

    // 2. NAVIGATION: Open the AboutPage
    await tester.tap(find.text("Open About"));
    await tester.pumpAndSettle(); // Wait for the "Push" animation

    // Verify we are actually on the AboutPage
    expect(find.byType(AboutPage), findsOneWidget);

    // 3. SCROLL TEST
    final scrollFinder = find.byType(SingleChildScrollView);
    await tester.drag(scrollFinder, const Offset(0, -500));
    await tester.pump();

    // 4. POP LOGIC (The actual fix)
    // Now that we have a page 'behind' us, Get.back() will actually work.
    final backButton = find.text("Back");
    expect(backButton, findsOneWidget);

    await tester.tap(backButton);
    await tester.pumpAndSettle(); // Wait for the "Pop" animation

    // 5. FINAL VERIFICATION
    // The AboutPage should be destroyed, returning us to the Dummy Root
    expect(find.byType(AboutPage), findsNothing);
    expect(find.text("Open About"), findsOneWidget);
  });
}
