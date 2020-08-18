import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/screens/home_screen.dart';
import 'package:music_app/screens/song_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.saralaTextTheme(Theme.of(context).textTheme)
      ),
      home: HomeScreen(),
      routes: {
        '/song': (ctx) => SongScreen()
      },
    );
  }
}
