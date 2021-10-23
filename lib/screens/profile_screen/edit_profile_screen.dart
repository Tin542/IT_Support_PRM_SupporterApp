import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:it_support/constant.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/screens/profile_screen/profile_screen.dart';

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
  TextEditingController nameTextNameController = TextEditingController();
  TextEditingController genderTextNameController = TextEditingController();
  TextEditingController phoneTextNameController = TextEditingController();

  TextEditingController textFirstNameController = TextEditingController();
  TextEditingController textLastNameController = TextEditingController();
  TextEditingController textPhoneController = TextEditingController();
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textStreetAddressController = TextEditingController();
  TextEditingController textLocalityController = TextEditingController();
  TextEditingController textCityController = TextEditingController();
  TextEditingController textPostalCodeController = TextEditingController();
  TextEditingController textHeightController = TextEditingController();
  TextEditingController textWeightController = TextEditingController();
  TextEditingController textAllergyController = TextEditingController();
  TextEditingController textBloodGroupController = TextEditingController();
  TextEditingController textBackgroundDiseaseController = TextEditingController();

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
                        padding: const EdgeInsets.only(left: 90),
                        child: TextField(
                          controller: genderTextNameController,
                          decoration: InputDecoration(
                            hintText: displayGender,
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.text,
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
                  SizedBox(height: 25),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text(
                          "Email:",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Text(
                          displayEmail,
                          style: TextStyle(
                            fontSize: 22,
                          ),
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
  void updateProfile() async {

    usersRef.child(user!.uid).update({
      'name' : nameTextNameController.text.trim(),
      'phone' : phoneTextNameController.text.trim(),
    });

    displayToastMessage("Tài khoản của bạn đã được tạo", context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
  }
  void getProfileuser() {
    itspRef.child(user!.uid).onValue.listen((event) {
      final data = new Map<String, dynamic>.from(event.snapshot.value);
      final email = data['email'] as String;
      final gender = data['gender'] as String;
      final name = data['name'] as String;
      final phone = data['phone'] as String;
      setState(() {
        displayEmail = '$email';
        displayGender = '$gender';
        displayName = '$name';
        displayPhone = '$phone';
        print(displayEmail);
        print(displayGender);
        print(displayName);
        print(displayPhone);
      });
    });
  }

  displayToastMessage(String message, BuildContext context){
    Fluttertoast.showToast(msg:message);
  }
}
