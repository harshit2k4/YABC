import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabc/controllers/theme_controller.dart';

class ThemeSwitcherBtn extends StatelessWidget {
  const ThemeSwitcherBtn({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  if (themeController.isDark.value) {
                    // switch theme to light
                    themeController.changeTheme();
                  }
                },
                icon: Icon(
                  Icons.light_mode,
                  // set color of active theme to primary color
                  color: themeController.isDark.value
                      ? Theme.of(context).colorScheme.onSecondaryContainer
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (!themeController.isDark.value) {
                    // switch theme to dark
                    themeController.changeTheme();
                  }
                },
                icon: Icon(
                  Icons.dark_mode,
                  // set color of active theme to primary color
                  color: !themeController.isDark.value
                      ? Theme.of(context).colorScheme.onSecondaryContainer
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
