import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/screens/auth_screen/login_screen.dart';


class RegisterScreen extends StatelessWidget {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController genderTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 40),
                child: Text(
                  "Xin Chào,\nChào Mừng !",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: nameTextEditingController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "HỌ VÀ TÊN",
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: genderTextEditingController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "GIỚI TÍNH",
                      labelStyle:
                      TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: phoneTextEditingController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "SỐ ĐIỆN THOẠI",
                      labelStyle:
                      TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: emailTextEditingController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "EMAIL",
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: passwordTextEditingController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "MẬT KHẨU",
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    onPressed: (){
                      if(nameTextEditingController.text.length < 1){
                        displayToastMessage("Tên ít nhất 2 kí tự", context);
                      } else if (!emailTextEditingController.text.contains("@")){
                        displayToastMessage("Email không hợp lệ", context);
                      } else if (passwordTextEditingController.text.length < 7){
                        displayToastMessage("Password ít nhất 8 kí tự", context);
                      } else {
                        registerNewUser(context);
                      }
                    },
                    child: Text(
                      "ĐĂNG KÝ",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;// authen vao firebase
  // final dailySpecialRef = database.reference.child("");
  void registerNewUser(BuildContext context) async {
    final User? firebaseUser = (await _firebaseAuth
        .createUserWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text).catchError((errMsg){
          displayToastMessage("Error: " + errMsg.toString(), context);
    })).user;

    if(firebaseUser != null){
      //luu thong tin user len database
      Map userDataMap ={
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
        "gender": genderTextEditingController.text.trim(),
      };

      itspRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("Tài khoản của bạn đã được tạo", context);

      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else{
      displayToastMessage("Người dùng mới không được tạo", context);
    }
  }
  displayToastMessage(String message, BuildContext context){
    Fluttertoast.showToast(msg:message);
  }
}
