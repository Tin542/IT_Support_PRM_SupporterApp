import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/models/request.dart';
import 'package:it_support/screens/call_screen/videocall_screen.dart';
import 'package:it_support/screens/request_screen/it_request_detail_screen.dart';

class waitingscreen extends StatefulWidget {
  const waitingscreen({Key? key}) : super(key: key);

  @override
  _listrequestState createState() => _listrequestState();
}

class _listrequestState extends State<waitingscreen> {
  User? user = FirebaseAuth.instance.currentUser;
  late String _chooseprice = '';

  final _ref = FirebaseDatabase.instance.reference().child("requests");

  Widget _price(String title) {
    return InkWell(
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          color: _chooseprice == title
              ? Colors.green
              : Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _chooseprice = title;
        });
      },
    );
  }

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
        child: request['it_email'] == user!.email
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                height: 210,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                        height: 30,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _price('20000'),
                            SizedBox(
                              width: 10,
                            ),
                            _price('30000'),
                            SizedBox(
                              width: 10,
                            ),
                            _price('40000'),
                            SizedBox(
                              width: 10,
                            ),
                            _price('50000'),
                            SizedBox(
                              width: 10,
                            ),
                            _price('60000'),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
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
                                .update({'status': 'Chờ thanh toán'});

                            reqRef
                                .child(request['key'])
                                .update({'price': _chooseprice});
                            displayToastMessage(
                                "Đã gửi hóa đơn cho khách hàng", context);
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
                              Text('Hoàn thành',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            reqRef
                                .child(request['key'])
                                .update({'status': 'Đang chờ xử lí'});
                            displayToastMessage(
                                "Hủy bỏ yêu cầu thành công", context);
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
                              Text('Hủy Bỏ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CallScreen()));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.video_call,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text('Video call',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            : Text(''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Danh sách chờ'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref.orderByChild("status").equalTo('Đang xử lí'),
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
