import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    // Responsive Values
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final buttonHeight = (height * 0.065).clamp(40.0, 55.0);
    final iconSize = (width * 0.06).clamp(18.0, 28.0);
    final fontSize = (width * 0.045).clamp(14.0, 20.0);
    final horizontalPadding = (width * 0.025).clamp(6.0, 16.0);
    final spacing = (width * 0.02).clamp(6.0, 14.0);

    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Obx(() {
          final bool isActive = genderContoller.rxGender.value == buttonTitle;

          return Container(
            height: buttonHeight,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: iconSize,
                  color: isActive
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: spacing),
                Flexible(
                  child: Text(
                    buttonTitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: fontSize,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                      color: isActive
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
