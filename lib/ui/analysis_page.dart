import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:yabc/controllers/bmi_controller.dart';
import 'package:yabc/ui/about_page.dart';
import 'package:yabc/widgets/action_button.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  final double maxBmiScale = 40.0;

  @override
  Widget build(BuildContext context) {
    final bmiController = Get.put(BMIController());

    // Fixed padding
    const double pagePadding = 25;

    // Fixed font sizes
    const double backIconSize = 20;
    const double titleFontSize = 28;
    const double bmiFontSize = 25;
    const double statusFontSize = 30;
    const double indicatorRadius = 100;
    const double indicatorLineWidth = 30;

    // Fixed-height placeholder text container
    final screenHeight = MediaQuery.of(context).size.height;
    final textContainerHeight = (screenHeight * 0.18);

    // Responsive spacing (tuned values)
    final smallGap = (screenHeight * 0.015).clamp(12.0, 22.0);
    final mediumGap = (screenHeight * 0.025).clamp(18.0, 32.0);
    final largeGap = (screenHeight * 0.035).clamp(24.0, 48.0);

    // Responsive margin for CircularPercentIndicator (above the indicator)
    final indicatorTopMargin = (screenHeight * 0.25).clamp(30.0, 40.0);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Fixed Header
              InkWell(
                onTap: () => Get.back(),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new, size: 20),
                    Text("Back"),
                  ],
                ),
              ),
              SizedBox(height: mediumGap),
              Obx(
                () => Text(
                  "Your body analysis",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    // color: bmiController.colorStatus.primary,
                    color: bmiController.colorStatus.value,
                  ),
                ),
              ),
              SizedBox(height: largeGap),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: indicatorTopMargin,
                      ), // Responsive top margin
                      // CircularPercentIndicator
                      Obx(
                        () => CircularPercentIndicator(
                          animationDuration: 1000,
                          radius: indicatorRadius,
                          lineWidth: indicatorLineWidth,
                          percent: (bmiController.bmiVal.value / maxBmiScale)
                              .clamp(0.0, 1.0),
                          center: Text(
                            bmiController.bmi.value,
                            style: TextStyle(
                              fontSize: bmiFontSize,
                              // color: bmiController.colorStatus.primary,
                              color: bmiController.colorStatus.value,
                            ),
                          ),

                          footer: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              bmiController.bmiStatus.value,
                              style: TextStyle(
                                fontSize: statusFontSize,
                                fontWeight: FontWeight.bold,
                                // color: bmiController.colorStatus.primary,
                                color: bmiController.colorStatus.value,
                              ),
                            ),
                          ),
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          // progressColor: bmiController.colorStatus.primary,
                          progressColor: bmiController.colorStatus.value,
                          // backgroundColor: Theme.of(context)
                          // .colorScheme.primary.withOpacity(0.2),
                          backgroundColor: bmiController.colorStatus.value
                              .withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Placeholder text container
              SizedBox(height: mediumGap),
              Container(
                height: textContainerHeight,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat, dolor tempor consequat iaculis, urna dolor tempor tellus, sit amet vestibulum orci velit non ligula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse potenti. Vivamus venenatis felis vel nisi maximus tincidunt. In ut sem ultrices, aliquam lorem egestas, vestibulum neque. Suspendisse non imperdiet elit. Phasellus eget semper dui, vitae volutpat ex. Duis malesuada ante vel est semper semper. Aenean eget aliquet mi, non sollicitudin nunc."
                    "Nulla in augue lectus. Donec in auctor sapien. Aliquam erat volutpat. Morbi lorem libero, consectetur convallis metus sit amet, auctor dapibus odio. Nulla fringilla tempor quam eget posuere. Interdum et malesuada fames ac ante ipsum primis in faucibus. In hac habitasse platea dictumst. Aliquam et nulla gravida, scelerisque est vel, lobortis libero. Suspendisse sodales euismod lectus, non posuere felis facilisis at. Praesent et diam felis. Suspendisse tempus ac quam non lacinia. Nulla posuere felis at faucibus egestas. Curabitur cursus lacus eu nulla posuere condimentum. Vivamus id erat eros.",
                  ),
                ),
              ),
              SizedBox(height: mediumGap),
              ActionButton(
                onPress:
                    // Go to about & disclaimer page
                    () => Get.to(() => AboutPage()),
                buttonTitle: "About & Disclaimer",
                icon: Icons.info_outline_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
