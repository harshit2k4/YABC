import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPress; // handle icon tap
  final IconData icon; // assign icon
  const SecondaryButton({super.key, required this.onPress, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primaryContainer,
          size: 20,
        ),
      ),
    );
  }
}
