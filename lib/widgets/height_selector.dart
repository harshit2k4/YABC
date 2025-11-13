import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:yabc/controllers/height_controller.dart';

class HeightSelector extends StatelessWidget {
  const HeightSelector({super.key});

  @override
  Widget build(BuildContext context) {
    HeightController heightController = Get.put(HeightController());

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Height",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ],
            ),
            // occupy entire container space
            Expanded(
              child: Obx(
                () => SfSlider.vertical(
                  min: 50,
                  max: 300,
                  value: heightController.height.value,
                  interval: 50,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  minorTicksPerInterval: 1,
                  onChanged: (dynamic value) {
                    // change height value
                    heightController.height.value = value;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
