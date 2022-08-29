import 'package:flutter/material.dart';
import 'package:mystore/admin/ui/dashboard/WidgetTree.dart';
import 'package:mystore/admin/ui/wizard.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      //drawer: const SideMenu(),
       appBar: AppBar(
          title: const Text("Medical Store Admin Panel"),
          actions: [
            IconButton(
                onPressed: () {
                Navigator.pop(context);
                },
                icon: const Icon(Icons.add))
          ],
        ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen

            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: WizardForm(),
            ),
          ],
        ),
      ),
    );
  }
}
