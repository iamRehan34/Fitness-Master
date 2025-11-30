import 'package:fitness_pro/Theme%20changer/Theme_changer.dart';
import 'package:fitness_pro/routes/app_pages.dart';
import 'package:fitness_pro/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeChanger themeChanger = ThemeChanger(ThemeMode.light);
  await themeChanger.loadThemeFromPrefs();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => themeChanger,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeChanger.themeMode, // Apply the theme
      initialRoute: AppRoutes.splash, // Define the initial route
      getPages: AppPages.pages,
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeChanger = Provider.of<ThemeChanger>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Theme Toggle Example"),
//         actions: [
//           IconButton(
//             icon: Icon(
//               themeChanger.themeMode == ThemeMode.light
//                   ? Icons.dark_mode
//                   : Icons.light_mode,
//             ),
//             onPressed: () {
//               // Toggle between light and dark themes
//               if (themeChanger.themeMode == ThemeMode.light) {
//                 themeChanger.setTheme(ThemeMode.dark);
//               } else {
//                 themeChanger.setTheme(ThemeMode.light);
//               }
//             },
//           ),
//         ],
//       ),
//       body: const Center(
//         child: Text("Tap the icon in the top right to toggle theme."),
//       ),
//     );
//   }
// }
