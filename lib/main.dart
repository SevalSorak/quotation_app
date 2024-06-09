import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/quote_page.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Özlü Söz Uygulaması',
      theme: lightThemeData(context), // Light theme
      darkTheme: darkThemeData(context), // Dark theme
      themeMode: ThemeMode.system, // System theme mode
      home: const QuotePage(),
    );
  }
}
