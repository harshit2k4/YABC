import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabc/controllers/age_weight_controller.dart';
import 'package:yabc/widgets/secondary_button.dart';

class AgeSelector extends StatelessWidget {
  const AgeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    AgeWeightController ageWeightController = Get.put(AgeWeightController());

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
                "AGE",
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
              Obx(
                () => Text(
                  "${ageWeightController.age.value}",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
            ],
          ),
          // increase button
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondaryButton(
                  onPress: () {
                    // increase age value
                    ageWeightController.age.value++;
                  },
                  icon: Icons.add,
                ),
                SecondaryButton(
                  onPress: () {
                    // decrease age value but don't go below 0
                    if (!(ageWeightController.age.value <= 0)) {
                      ageWeightController.age.value--;
                    }
                  },
                  icon: Icons.remove,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
