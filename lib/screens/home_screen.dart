import 'package:flutter/material.dart';
import 'package:it_support/screens/components/body.dart';


import 'dart:ui';

import 'components/load_image.dart';

class HomeScreenCustomer extends StatefulWidget {
  const HomeScreenCustomer({Key? key}) : super(key: key);

  @override
  _HomeScreenCustomerState createState() => new _HomeScreenCustomerState();
}

class _HomeScreenCustomerState extends State<HomeScreenCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("ITSupport"),
        ),
        body: Body());
  }
}
