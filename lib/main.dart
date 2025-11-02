import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/weather_page.dart';
import 'package:myapp/utils/theme_notifier.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const double baseFontSize = 25.0;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: GoogleFonts.oswald().fontFamily,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: baseFontSize),
          bodyLarge: TextStyle(fontSize: baseFontSize + 2),
          titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ).apply(fontFamily: GoogleFonts.oswald().fontFamily),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.oswald().fontFamily,
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
