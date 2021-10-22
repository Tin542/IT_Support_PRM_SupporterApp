import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_support/firebase_database/database.dart';

class donescreen extends StatefulWidget {
  const donescreen({Key? key}) : super(key: key);

  @override
  _listrequestState createState() => _listrequestState();
}

class _listrequestState extends State<donescreen> {
  final _ref = FirebaseDatabase.instance.reference().child("requests");

  Widget _buildRequestItem({required Map request}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 130,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.people,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                request['problem'],
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.devices_other_outlined,
                color: Colors.red,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                request['device'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.description_outlined,
                color: Colors.purple,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                request['user_email'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.purple,
                    fontWeight: FontWeight.w600),
              ),
              
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.sort_outlined,
                color: Colors.green,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                request['status'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.w600),
              ),
              
              
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Danh sách hoàn thành'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref.orderByChild("status").equalTo('đã xử lí xong'),
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map request = snapshot.value;
            request['key'] = snapshot.key;
            return _buildRequestItem(request: request);
          },
        ),
      ),
    );
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
