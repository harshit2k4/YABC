import 'package:flutter/material.dart';

class ThemeSwitcherBtn extends StatelessWidget {
  const ThemeSwitcherBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
              IconButton(onPressed: () {}, icon: Icon(Icons.light_mode)),
            ],
          ),
        ),
      ],
    );
  }
}
