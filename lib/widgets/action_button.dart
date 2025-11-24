import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onPress;
  final String buttonTitle;
  final IconData icon;

  const ActionButton({
    super.key,
    required this.onPress,
    required this.buttonTitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // get screen information
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Responsive values WITH CLAMPS
    final buttonHeight = height * 0.065;

    final iconSize = (width * 0.06).clamp(18.0, 28.0);
    // min 18px (tiny phones), max 28px (desktop)

    final fontSize = (width * 0.045).clamp(14.0, 20.0);
    // min 14px, max 20px

    final horizontalPadding = width * 0.025;

    return InkWell(
      onTap: onPress,
      child: Container(
        height: buttonHeight.clamp(40.0, 55.0), // prevents huge button height
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // assign the color based on the active button
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primaryContainer,
              size: iconSize,
            ),
            SizedBox(width: width * 0.02),
            Flexible(
              child: Text(
                buttonTitle,
                style: TextStyle(
                  fontSize: fontSize,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
