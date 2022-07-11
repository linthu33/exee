import 'package:flutter/material.dart';
import 'package:mystore/admin/ui/dashboard/WidgetTree.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      //drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen

            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: WidgetTree(),
            ),
          ],
        ),
      ),
    );
  }
}
