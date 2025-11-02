import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/weather_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const double baseFontSize = 25.0;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
      theme: ThemeData(
        fontFamily: GoogleFonts.oswald().fontFamily,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: baseFontSize),
          bodyLarge: TextStyle(fontSize: baseFontSize + 2),
          titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ).apply(fontFamily: GoogleFonts.oswald().fontFamily),
        useMaterial3: true,
      ),
    );
  }
}
