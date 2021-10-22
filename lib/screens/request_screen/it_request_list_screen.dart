import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_support/firebase_database/database.dart';

class listrequest extends StatefulWidget {
  const listrequest({Key? key}) : super(key: key);

  @override
  _listrequestState createState() => _listrequestState();
}

class _listrequestState extends State<listrequest> {
  final _ref = FirebaseDatabase.instance.reference().child("requests");
  

  Widget _buildRequestItem({required Map request}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 150,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.report_problem,
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
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(
                Icons.sort_outlined,
                color: Colors.orange,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                request['status'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
                    fontWeight: FontWeight.w600),
              ),
              
              
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                
            GestureDetector(onTap: (){
              reqRef.child(request['key']).update({'status' : 'đang xử lí'});
              displayToastMessage("Chấp nhận thành công", context);
            },
            child: Row(children: [
              Icon(Icons.check_box, color: Colors.green,),
              SizedBox(width: 6,),

              Text('Chấp nhận',
              style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.w600)),
            ],),)
          ],)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Danh sách yêu cầu'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref.orderByChild("status").equalTo('đang chờ xử lí'),
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
