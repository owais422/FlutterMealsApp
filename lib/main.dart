import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
// import 'package:ud_meals_app/data/dummy_data.dart';
// import 'package:ud_meals_app/screens/categories.dart';
import 'package:ud_meals_app/screens/tabs.dart';
// import 'package:ud_meals_app/screens/tabs.dart';
// import 'package:ud_meals_app/screens/meals.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        home: const TabsScreen()
        //   const CategoriesScreen(),
        );
  }
}
