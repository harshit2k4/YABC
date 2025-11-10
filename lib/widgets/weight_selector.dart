import 'package:flutter/material.dart';
import 'package:yabc/widgets/secondary_button.dart';

class WeightSelector extends StatelessWidget {
  const WeightSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      height: 200,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Weight",
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
          // show current selected weight
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "45",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
          // increase button
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondaryButton(onPress: () {}, icon: Icons.add),
                SecondaryButton(onPress: () {}, icon: Icons.remove),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
