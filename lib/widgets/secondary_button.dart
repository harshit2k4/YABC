import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPress; // handle icon tap
  final IconData icon; // assign icon
  const SecondaryButton({super.key, required this.onPress, required this.icon});

  @override
  Widget build(BuildContext context) {
    // Responsive sizes
    final width = MediaQuery.of(context).size.width;
    final padding = (width * 0.025).clamp(6.0, 14.0);

    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primaryContainer,
          size: 22,
        ),
      ),
    );
  }
}
