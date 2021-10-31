import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/models/request.dart';
import 'package:it_support/screens/request_screen/it_request_detail_screen.dart';

class donescreen extends StatefulWidget {
  const donescreen({Key? key}) : super(key: key);

  @override
  _listrequestState createState() => _listrequestState();
}

class _listrequestState extends State<donescreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final _ref = FirebaseDatabase.instance.reference().child("requests");

  Widget _buildRequestItem({required Map request}) {
    return GestureDetector(
      onTap: (){
        final requestDetail = Request.fromRTDB(request);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailRequestScreen(request: requestDetail)));
      },
      child: request['it_email'] == user!.email? Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        height: 230,
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
                
                
              ],
            ),
             SizedBox(height: 10,),
            Row(
              children: [
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
             SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.star_border_purple500,
                  color: Colors.amber[600],
                  size: 20,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  request['rating'],
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.amber[600],
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
                  Icons.design_services,
                  color: Colors.teal[400],
                  size: 20,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  request['feedback'],
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.teal[400],
                      fontWeight: FontWeight.w600),
                ),
                
                
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    reqRef
                        .child(request['key'])
                        .remove();
                    displayToastMessage("Đã xóa yêu cầu", context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('Xóa khỏi danh sách',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
            
          ],
            ),
          ],
        ),
      ):Text('')
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
          query: _ref.orderByChild("status").equalTo('Hoàn thành'),
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
