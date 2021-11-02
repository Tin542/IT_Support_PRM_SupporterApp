import 'package:animated_textformfields/animated_textformfield/animated_textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:it_support/constant.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/screens/bottom_nav_bar_screen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final User? user = FirebaseAuth.instance.currentUser;
  String displayEmail = '';
  String displayGender = '';
  String displayName = '';
  String displayPhone = '';
  String displayDob = '';
  String _choosegender = '';
  FocusNode myFocusNode1 = FocusNode();
  TextEditingController nameTextNameController = TextEditingController();
  TextEditingController genderTextNameController = TextEditingController();
  TextEditingController phoneTextNameController = TextEditingController();
  TextEditingController dobTextEditingController = TextEditingController();

  var selectedGender;

  @override
  void initState() {
    super.initState();
    getProfileuser();
    setState(() {
      selectedGender = displayGender;
    });
  }

  setSelectedGender(var value) {
    setState(() {
      selectedGender = value;
    });
  }

  late DateTime dob = DateTime.now();

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime.now().year + 1));

    if (newDate == null) return;

    setState(() {
      dob = newDate as DateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chỉnh sửa thông tin cá nhân",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kBlueColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/Yeti.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(150, 150, 0, 0),
                          child: Icon(Icons.camera_alt_outlined),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
                        child: Text(
                          "Tên:",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90),
                        child: TextField(
                          controller: nameTextNameController,
                          decoration: InputDecoration(
                            hintText: displayName,
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
                        child: Text(
                          "Di Động:",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90),
                        child: TextField(
                          controller: phoneTextNameController,
                          decoration: InputDecoration(
                            hintText: displayPhone,
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
                        child: Text(
                          "Email:",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(95, 9, 0, 0),
                        child: Text(
                          displayEmail,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
                        child: Text(
                          "Giới tính:",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(95, 9, 0, 0),
                        child: Text(
                          displayGender,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
                    child: Container(
                      height: 30,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _gender('Nam'),
                          SizedBox(
                            width: 10,
                          ),
                          _gender('Nữ'),
                          SizedBox(
                            width: 10,
                          ),
                          _gender('Khác'),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
                        child: Text(
                          "Ngày sinh:",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedTextFormField(
                              width: 140,
                              height: 48.0,
                              inputType: TextInputType.text,
                              hintText: displayDob,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'pick date';
                                }
                                return null;
                              },
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                              controller: dobTextEditingController,
                              focusNode: myFocusNode1,
                              cornerRadius: BorderRadius.circular(14.0),
                              onTap: () async {
                                DateTime date = DateTime(1900);

                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());

                                date = (await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100)))!;
                                var formattedDate =
                                    "${date.day}-${date.month}-${date.year}";
                                dobTextEditingController.text =
                                    formattedDate.toString();
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 20, 0, 0),
                    child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      onPressed: () {
                        if (nameTextNameController.text.isEmpty) {
                          displayToastMessage(
                              "Vui lòng điền tên của bạn", context);
                        } else if (phoneTextNameController.text.isEmpty) {
                          displayToastMessage(
                              "Vui lòng điền số điện thoại của bạn", context);
                        } else {
                          updateProfile();
                        }
                      },
                      child: Text(
                        "Lưu",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gender(String title) {
    return InkWell(
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          color: _choosegender == title
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
          _choosegender = title;
        });
      },
    );
  }

  void updateProfile() async {
    itspRef.child(user!.uid).update({
      'name': nameTextNameController.text.trim(),
      'phone': phoneTextNameController.text.trim(),
      "gender": _choosegender,
      'dob': dobTextEditingController.text.trim(),
    });

    displayToastMessage("Cập nhập thông tin thành công", context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
  }

  void getProfileuser() {
    itspRef.child(user!.uid).onValue.listen((event) {
      final data = new Map<String, dynamic>.from(event.snapshot.value);
      final email = data['email'] as String;
      final gender = data['gender'] as String;
      final name = data['name'] as String;
      final phone = data['phone'] as String;
      final dob = data['dob'] as String;
      setState(() {
        displayEmail = '$email';
        displayGender = '$gender';
        displayName = '$name';
        displayPhone = '$phone';
        displayDob = '$dob';
        print(displayEmail);
        print(displayGender);
        print(displayName);
        print(displayPhone);
        print(displayDob);
      });
    });
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
