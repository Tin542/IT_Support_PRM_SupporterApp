import 'package:flutter/material.dart';
import 'package:it_support/constant.dart';
import 'package:it_support/screens/components/it_card.dart';

class ListItScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh Sách IT Hỗ Trợ"),
        automaticallyImplyLeading: false,
        backgroundColor: kBlueColor,
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Chào, Chúng tôi có thể giúp gì cho bạn?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildITList(),
            ],
          ),
        ),
      ),
    );
  }

  buildITList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          ITCard(
            'Nguyen Van A',
            'Software Engineer\nFPT Software',
            'assets/images/Yeti.png',
            kBlueColor,
          ),
          SizedBox(
            height: 20,
          ),
          ITCard(
            'Nguyen Van B',
            'AI Engineer\nFPT Software',
            'assets/images/Yeti.png',
            kYellowColor,
          ),
          SizedBox(
            height: 20,
          ),
          ITCard(
            'Nguyen Van C',
            'Tester\nFPT Software',
            'assets/images/Yeti.png',
            kOrangeColor,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
