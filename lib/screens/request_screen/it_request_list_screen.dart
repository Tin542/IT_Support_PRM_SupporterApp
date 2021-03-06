import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/models/request.dart';
import 'package:it_support/screens/request_screen/it_request_detail_screen.dart';

class listrequest extends StatefulWidget {
  const listrequest({Key? key}) : super(key: key);

  @override
  _listrequestState createState() => _listrequestState();
}

class _listrequestState extends State<listrequest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItEmail();
  }

  void getItEmail() {
    itspRef.child(user!.uid).onValue.listen((event) {
      final data = new Map<String, dynamic>.from(event.snapshot.value);
      final email = data['email'] as String;

      setState(() {
        itEmail = '$email';
      });
    });
  }

  User? user = FirebaseAuth.instance.currentUser;
  String itEmail = '';
  final _ref = FirebaseDatabase.instance.reference().child("requests");

  Widget _buildRequestItem({required Map request}) {
    return GestureDetector(
      onTap: () {
        final requestDetail = Request.fromRTDB(request);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailRequestScreen(request: requestDetail)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        height: 200,
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
            SizedBox(
              height: 10,
            ),
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
                  color: Colors.amberAccent,
                  size: 20,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  request['status'],
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    reqRef.child(request['key']).update(
                      {'status': '??ang x??? l??', 'it_email': itEmail},
                    );
                    displayToastMessage("Ch???p nh???n th??nh c??ng", context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_box,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('Ch???p nh???n',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Danh s??ch y??u c???u'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref.orderByChild("status").equalTo('??ang ch??? x??? l??'),
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
