import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabc/controllers/theme_controller.dart';
import 'package:yabc/widgets/theme_switcher_btn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // init theme controller
    ThemeController themeController = Get.put(ThemeController());

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [ThemeSwitcherBtn()]),
      ),
    );
  }
}
