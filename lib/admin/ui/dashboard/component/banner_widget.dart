import 'package:flutter/material.dart';
import 'package:mystore/admin/responsive.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget theBigBox(List<Widget> widgets) => Card(
          child: Row(children: widgets),
        );
    Widget box1() => const ListTile(
          leading: Icon(Icons.book),
          title: Text("Yoo"),
          subtitle: Text("Looo"),
          trailing: Chip(label: Text("3,999")),
        );
    Widget box2() => const ListTile(
          leading: Icon(Icons.book),
          title: Text("Yoo2"),
          subtitle: Text("Looo2"),
          trailing: Chip(label: Text("3,999")),
        );
    Widget box3() => const ListTile(
          leading: Icon(Icons.book),
          title: Text("Yoo3"),
          subtitle: Text("Looo3"),
          trailing: Chip(label: Text("3,999")),
        );
    return ResponsiveLayout(
        tiny: Container(),
        phone: theBigBox([box1()]),
        tablet: theBigBox([box1()]),
        largeTablet: theBigBox([box1(), box2()]),
        computer: theBigBox([box1(), box2(), box3()]));
  }
}
