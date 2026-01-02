import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:yabc/widgets/theme_switcher_btn.dart';
import 'package:yabc/controllers/theme_controller.dart';
import 'package:yabc/utils/themes.dart';

void main() {
  setUp(() => Get.testMode = true);
  tearDown(() => Get.reset());

  testWidgets('Theme Switcher: Bulletproof UI & Logic Verification', (
    tester,
  ) async {
    final themeController = Get.put(ThemeController());

    // 1. Setup: Pump GetMaterialApp with your ACTUAL themes to simulate the real app
    await tester.pumpWidget(
      GetMaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: const Scaffold(body: ThemeSwitcherBtn()),
      ),
    );

    // --- INITIAL STATE CHECK (Light Mode) ---
    expect(themeController.isDark.value, false);

    final lightIconFinder = find.byIcon(Icons.light_mode);
    final darkIconFinder = find.byIcon(Icons.dark_mode);

    // Verify visual: Light icon should be "Primary" and Dark should be "Inactive"
    Icon lightIcon = tester.widget<Icon>(lightIconFinder);
    Icon darkIcon = tester.widget<Icon>(darkIconFinder);

    expect(
      lightIcon.color,
      lightTheme.colorScheme.primary,
      reason: "In Light Mode, the Sun icon must be the primary color.",
    );
    expect(
      darkIcon.color,
      lightTheme.colorScheme.onSecondaryContainer,
      reason: "In Light Mode, the Moon icon must be the inactive label color.",
    );

    // --- THE ACTION ---
    // Tap the dark mode button
    await tester.tap(darkIconFinder);
    await tester.pumpAndSettle(); // Wait for theme transition animation

    // --- FINAL VALIDATION (Dark Mode) ---
    expect(themeController.isDark.value, true);

    // Re-verify visual state: The colors should have swapped roles
    Icon lightIconAfter = tester.widget<Icon>(lightIconFinder);
    Icon darkIconAfter = tester.widget<Icon>(darkIconFinder);

    expect(
      darkIconAfter.color,
      darkTheme.colorScheme.primary,
      reason: "In Dark Mode, the Moon icon must now be the primary color.",
    );
    expect(
      lightIconAfter.color,
      darkTheme.colorScheme.onSecondaryContainer,
      reason:
          "In Dark Mode, the Sun icon must now be the inactive label color.",
    );

    // THE ULTIMATE CHECK: Does the app context actually report Dark Brightness?
    final BuildContext context = tester.element(find.byType(ThemeSwitcherBtn));
    expect(
      Theme.of(context).brightness,
      Brightness.dark,
      reason:
          "The actual Flutter Theme brightness must flip to Dark for the user.",
    );
  });
}
