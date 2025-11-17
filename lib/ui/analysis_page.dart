import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:yabc/controllers/bmi_controller.dart';
import 'package:yabc/widgets/action_button.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SafeArea(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new, size: 20),
                    Text("Back"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Your body analysis",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // to take entire available space
              Expanded(
                child: SizedBox(
                  height: 350,
                  child: Obx(
                    () => CircularPercentIndicator(
                      animationDuration: 1000,
                      footer: Text(
                        bmiController.bmiStatus.value,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      radius: 100,
                      lineWidth: 30.0,
                      percent: bmiController.bmiVal.value / 100,
                      center: Text(
                        bmiController.bmi.value,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 25,
                        ),
                      ),
                      animation: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra ut odio ac aliquet. Aliquam erat volutpat. Donec id leo id sapien pellentesque convallis in eget sem. Quisque viverra lacus in ex sodales iaculis. Proin vestibulum justo a efficitur gravida. Curabitur fringilla neque ac quam congue, eget egestas nulla pulvinar",
                ),
              ),
              SizedBox(height: 20),
              ActionButton(
                onPress: () {
                  // Show disclaimer page
                },
                buttonTitle: "Disclaimer",
                icon: Icons.info_outline_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
