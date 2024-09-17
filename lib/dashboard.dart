import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/desktop/home_screen.dart';
import 'package:website_desa/dashboard/mobile/home_screen.dart';
import 'package:website_desa/dashboard/tablet/home_screen1.dart';
import 'package:website_desa/widget/responsive.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: HomeScreen(),
      mobile: HomeScreen2(),
      tablet: HomeScreen1(),
    );
  }
}
