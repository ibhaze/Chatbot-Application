import 'package:chatbot/home_page.dart';
import 'package:chatbot/pallete.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PIE chatbot',
      theme:ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Pallete.greyColor,//This calls the pallete class from the other dart file so that i don't have to waste time here writing code for colors 
        appBarTheme: const AppBarTheme(
          backgroundColor: Pallete.greyColor,
          
        )
      ),
      home: const HomePage (),
    );
  }
}