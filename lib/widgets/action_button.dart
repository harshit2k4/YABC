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
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // assign the color based on the active button
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primaryContainer),
            SizedBox(width: 10),
            Text(
              buttonTitle,
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
