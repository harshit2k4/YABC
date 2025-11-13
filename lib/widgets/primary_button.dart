import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:yabc/controllers/gender_contoller.dart';

class PrimaryButton extends StatelessWidget {
  final IconData icon;
  final String buttonTitle;
  final VoidCallback onPress;

  const PrimaryButton({
    super.key,
    required this.icon,
    required this.buttonTitle,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    GenderContoller genderContoller = Get.put(GenderContoller());

    return Expanded(
      // Button takes entire available width
      child: InkWell(
        onTap: onPress,
        // keep the button stateful, to allow state change
        child: Obx(
          () => Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // assign the color based on the active button
              color: genderContoller.rxGender.value == buttonTitle
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: genderContoller.rxGender.value == buttonTitle
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: 10),
                Text(
                  buttonTitle,
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    color: genderContoller.rxGender.value == buttonTitle
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
