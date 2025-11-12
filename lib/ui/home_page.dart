import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabc/controllers/theme_controller.dart';
import 'package:yabc/widgets/age_selector.dart';
import 'package:yabc/widgets/height_selector.dart';
import 'package:yabc/widgets/primary_button.dart';
import 'package:yabc/widgets/theme_switcher_btn.dart';
import 'package:yabc/widgets/weight_selector.dart';

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
              Row(
                children: [
                  // Male
                  PrimaryButton(
                    icon: Icons.male,
                    buttonTitle: "MALE",
                    onPress: () {},
                  ),
                  SizedBox(width: 16),
                  // Female
                  PrimaryButton(
                    icon: Icons.female,
                    buttonTitle: "FEMALE",
                    onPress: () {},
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Height selector
                    HeightSelector(),
                    SizedBox(width: 16),
                    // Weight and age selector
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WeightSelector(),
                          SizedBox(height: 10),
                          AgeSelector(),
                        ],
                      ),
                    ), // some
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: PrimaryButton(
                  icon: Icons.done,
                  buttonTitle: "LET'S GO!",
                  onPress: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
