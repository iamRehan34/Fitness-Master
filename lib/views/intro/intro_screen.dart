import 'package:fitness_pro/constants/ReusableContainerwidget.dart';
import 'package:fitness_pro/controllers/intro_controller.dart';
import 'package:fitness_pro/views/intro/View/List_intro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  final IntroController controller = Get.put(IntroController());
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, '/input_Details_Light');
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Color(0xFF0094E8), fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                onPageChanged: (index) => controller.updatePage(index),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 150),
                        child: Center(
                          child: Image.asset(
                            pages[index]['image'],
                            height: 456,
                            width: 275,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                pages[index]['text'],
                                style: const TextStyle(
                                    fontSize: 28, color: Color(0xFF2F2F2F)),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // Bottom Section
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                    (index) => Container(
                      margin: const EdgeInsets.all(4),
                      width: controller.pageIndex.value == index ? 20 : 8,
                      height: 3,
                      decoration: BoxDecoration(
                        color: controller.pageIndex.value == index
                            ? const Color(0xFF0094E8)
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: ReusableContainerWidget(
                      text: 'Next',
                      onTap: () {
                        if (controller.pageIndex.value < pages.length - 1) {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          // When the last page is reached, navigate to the next screen
                          Navigator.pushReplacementNamed(
                            context,
                            '/input_Details_Light', // Replace '/Home' with the name of your next screen route
                          );
                        }
                      },
                      color: const Color(
                          0xFF0094E8), // Use the desired color for "Next"
                    ),
                  ),
                ),
                // Navigation Buttons
                SizedBox(
                  height: 70,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
