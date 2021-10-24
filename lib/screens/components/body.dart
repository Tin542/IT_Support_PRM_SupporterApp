import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/screens/components/backgound.dart';
import 'package:it_support/screens/components/dropdown_button.dart';
import 'package:it_support/screens/components/rounded_input_field.dart';
import 'package:it_support/screens/request_screen/it_support_list_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController ticketNameTextEditingController =
      TextEditingController();
  final TextEditingController descriptionTextEditingController =
      TextEditingController();
  final TextEditingController idTVTextEditingController =
      TextEditingController();
  final TextEditingController passTVTextEditingController =
      TextEditingController();
  final TextEditingController statusTextEditingController =
      TextEditingController();
  final TextEditingController deviceTextEditingController =
      TextEditingController();

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              "assets/images/Banner.png",
              width: size.width * 0.8,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: size.width * 0.8,
              color: Color(0xFFCFE9F1),
              // color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RoundedInputField(
                    controller: deviceTextEditingController,
                    hintText: "Thiết bị",
                    onChanged: (value) {
                      controller:
                      deviceTextEditingController;
                    },
                  ),
                  RoundedInputField(
                    controller: ticketNameTextEditingController,
                    hintText: "Tên vấn đề",
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    controller: descriptionTextEditingController,
                    hintText: "Chi tiết vấn đề",
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    controller: idTVTextEditingController,
                    hintText: "ID teamView",
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    controller: passTVTextEditingController,
                    hintText: "Pass teamView",
                    onChanged: (value) {},
                  ),
                  // RoundedInputField(
                  //     hintText: "Explan your problem by picture...",
                  //     onChanged: (value) {},
                  //     icon: Icons.drive_folder_upload),
                  FlatButton(
                    onPressed: () {
                      reqRef.child(user!.uid).push().set({
                        'device': deviceTextEditingController.text,
                        'problem': ticketNameTextEditingController.text,
                        'description': descriptionTextEditingController.text,
                        'id_teamView': idTVTextEditingController.text,
                        'pass_TeamView': passTVTextEditingController.text,
                        'status': 'đang xử lí'
                      });
                    },
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void submitRequest(BuildContext context) async {
    // final User? firebaseUser = (await _firebaseAuth
    //         .createUserWithEmailAndPassword(
    //             email: emailTextEditingController.text,
    //             password: passwordTextEditingController.text)
    //         .catchError((errMsg) {
    //   displayToastMessage("Error: " + errMsg.toString(), context);
    // }))
    //     .user;

    // if (firebaseUser != null) {
    //   //luu thong tin user len database
    //   Map userDataMap = {
    //     "name": nameTextEditingController.text.trim(),
    //     "email": emailTextEditingController.text.trim(),
    //   };

    //   usersRef.child(firebaseUser.uid).set(userDataMap);
    //   displayToastMessage("Tài khoản của bạn đã được tạo", context);

    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => LoginScreen()));
    // } else {
    //   displayToastMessage("Người dùng mới không được tạo", context);
    // }
  }
}
