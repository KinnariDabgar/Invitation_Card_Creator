import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:invitation_card/screens/cardcreateScreen.dart';
import 'package:invitation_card/screens/gridimageScreen.dart';
import 'package:invitation_card/widgets/appcolors.dart' as AppColors;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: gridImageScreen(),
    );
  }
}
