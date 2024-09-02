import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:website_desa/dashboard.dart';
// import 'package:website_desa/widget/side_menu.dart';

import 'widget/responsive.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          if (Responsive.isMobile(context))
            Expanded(flex: 5, child: Dashboard())
        ],
      )),
    );
  }
}
