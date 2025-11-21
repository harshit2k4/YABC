import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new, size: 20),
                    Text("Back"),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Title
              Text(
                "About & Disclaimer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 20),

              // Responsive Content Area
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // App Information
                      Text(
                        "YABC: Yet Another BMI Calculator",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Version 0.1.0",
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).colorScheme.onBackground.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Disclaimer Section
                      Text(
                        "Important Disclaimer",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "This application is for informational and educational purposes only. The Body Mass Index (BMI) calculation is based on standard formulas and is only one metric for assessing body health. "
                        "It is NOT a substitute for professional medical advice, diagnosis, or treatment. Always consult with a qualified healthcare professional regarding any health concerns or before making any decisions related to your health or diet.",
                      ),
                      const SizedBox(height: 20),

                      // Formula Source
                      Text(
                        "BMI Formula Source",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "The calculation uses the standard formula:\nBMI = Weight (in kg) / Height² (in meters)",
                      ),

                      // Padding at the bottom for better visual spacing
                      const SizedBox(height: 25),

                      Text(
                        "Made with ❤️",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(
                            context,
                          ).colorScheme.onBackground.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
