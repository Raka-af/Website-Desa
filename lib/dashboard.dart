import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/desktop/home_screen.dart';
import 'package:website_desa/dashboard/mobile/home_screen.dart';
import 'package:website_desa/dashboard/tablet/home_screen1.dart';
import 'package:website_desa/widget/responsive.dart';

class Dashboard extends StatelessWidget {
  final int selectedIndex;

  const Dashboard({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: HomeScreen(
        selectedIndex: selectedIndex,
      ),
      mobile: HomeScreen2(),
      tablet: HomeScreen1(),
    );
  }
}
