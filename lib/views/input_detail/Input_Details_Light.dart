import 'package:fitness_pro/constants/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:fitness_pro/constants/imageWidget.dart';

class Input_Details_Light extends StatefulWidget {
  const Input_Details_Light({super.key});

  @override
  State<Input_Details_Light> createState() => _Input_Details_LightState();
}

class _Input_Details_LightState extends State<Input_Details_Light> {
  int _currentStep = 0; // Tracks the current progress (0 to 3)
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void _nextScreen() {
    // Move to the next step
    if (_currentStep < 3) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _previousScreen() {
    // Move to the previous step
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            // Back Icon
            Padding(
              padding: const EdgeInsets.only(left: 29),
              child: Image.asset(
                AppAssets.backIcon,
                height: 14,
                width: 6,
              ),
            ),
            // Content Section
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  // Progress Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 6,
                          decoration: BoxDecoration(
                            color: index <= _currentStep
                                ? Color(0xFF0094E8) // Blue for completed steps
                                : Color(
                                    0xFFA9ABAE), // Grey for incomplete steps
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Tell us about yourself!",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  // Custom Text Fields
                  CustomTextField(
                    hintText: 'Enter your name',
                    imagePath: AppAssets.emailIcon,
                    controller: nameController,
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: 'Enter your email',
                    imagePath: AppAssets.passwordIcon,
                    controller: emailController,
                  ),
                  SizedBox(height: 10),
                  PhoneWidget(),
                  SizedBox(height: 20),
                  // Navigation Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _previousScreen,
                        child: Text('Previous'),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: _nextScreen,
                        child: Text('Next'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
