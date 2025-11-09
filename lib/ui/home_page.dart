import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabc/controllers/theme_controller.dart';
import 'package:yabc/widgets/primary_button.dart';
import 'package:yabc/widgets/theme_switcher_btn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // init theme controller
    ThemeController themeController = Get.put(ThemeController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ThemeSwitcherBtn(),
              Row(
                children: [
                  Text(
                    "Namaste!",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "YABC: Yet Another BMI Calculator",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Sex selector button
              const Row(
                children: [
                  // Male
                  PrimaryButton(icon: Icons.male, buttonTitle: "MALE"),
                  SizedBox(width: 16),
                  // Female
                  PrimaryButton(icon: Icons.female, buttonTitle: "FEMALE"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
