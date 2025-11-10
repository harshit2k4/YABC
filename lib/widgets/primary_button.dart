import 'package:flutter/material.dart';

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
    return Expanded(
      // Button takes entire available width
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.background),
              SizedBox(width: 10),
              Text(
                buttonTitle,
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
