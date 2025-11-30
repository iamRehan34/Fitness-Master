// // import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';

// class ProgressBarScreen extends StatefulWidget {
//   @override
//   _ProgressBarScreenState createState() => _ProgressBarScreenState();
// }

// class _ProgressBarScreenState extends State<ProgressBarScreen> {
//   int _currentStep = 0; // Tracks the current progress (0 to 3)

//   void _nextScreen() {
//     // Move to the next step
//     if (_currentStep < 3) {
//       setState(() {
//         _currentStep++;
//       });
//     }
//   }

//   void _previousScreen() {
//     // Move to the previous step
//     if (_currentStep > 0) {
//       setState(() {
//         _currentStep--;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Progress Bar Example'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Progress Bar
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(4, (index) {
//               return Expanded(
//                 flex: 1,
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 4),
//                   height: 6,
//                   decoration: BoxDecoration(
//                     color: index <= _currentStep
//                         ? Color(0xFF0094E8) // Blue for completed steps
//                         : Color(0xFFA9ABAE), // Grey for incomplete steps
//                     borderRadius: BorderRadius.circular(17),
//                   ),
//                 ),
//               );
//             }),
//           ),
//           SizedBox(height: 20),
//           // Navigation Buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: _previousScreen,
//                 child: Text('Previous'),
//               ),
//               SizedBox(width: 20),
//               ElevatedButton(
//                 onPressed: _nextScreen,
//                 child: Text('Next'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
