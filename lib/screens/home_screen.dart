import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/screens/components/body.dart';

class HomeScreenCustomer extends StatefulWidget {
  const HomeScreenCustomer({Key? key}) : super(key: key);

  @override
  _HomeScreenCustomerState createState() => new _HomeScreenCustomerState();
}

class _HomeScreenCustomerState extends State<HomeScreenCustomer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }

  User? user = FirebaseAuth.instance.currentUser;
  String displayName = '';

  void getName() {
    itspRef.child(user!.uid).onValue.listen((event) {
      final data = new Map<String, dynamic>.from(event.snapshot.value);
      final name = data['name'] as String;
      setState(() {
        displayName = '$name';
        print(displayName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Hello, " + displayName),
        ),
        body: Body());
  }
}
