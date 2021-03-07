import 'package:flutter/material.dart';
import 'package:utilapp/presentation/sign_in/sign_in_page.dart';
import 'package:utilapp/res/colors.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UtilApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: LightColors.yellow,
        accentColor: LightColors.darkGrey,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      home: SignInPage(),
    );
  }
}
