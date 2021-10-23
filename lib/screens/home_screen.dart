import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/screens/components/body.dart';


import 'dart:ui';

import 'components/load_image.dart';

class HomeScreenCustomer extends StatefulWidget {
  const HomeScreenCustomer({Key? key}) : super(key: key);

  @override
  _HomeScreenCustomerState createState() => new _HomeScreenCustomerState();
}

class _HomeScreenCustomerState extends State<HomeScreenCustomer> {
  User? user = FirebaseAuth.instance.currentUser;

  String userName = '';

  void getName() {
    usersRef.child(user!.uid).child('name').onValue.listen((event) {
      
      setState(() {
        print("name: " + userName);
        userName = event.snapshot.value;
        
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Hello, " + userName),
        ),
        body: Body());
  }
}
