import 'package:flutter/material.dart';
import 'package:it_support/constant.dart';
import 'package:it_support/screens/components/detail_card.dart';

class ListRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh Sách Yêu Cầu"),
        backgroundColor: kBlueColor,
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 140,
              ),
              buildDetailList(),
            ],
          ),
        ),
      ),
    );
  }

  buildDetailList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          DetailCard(
            'Nguyễn Văn A',
            'Thiết bị : Laptop Asus',            
            'assets/images/Yeti.png',
            kBlueColor,
          ),
          SizedBox(
            height: 20,
          ),
          DetailCard(
            'Nguyễn Văn B',
            'Thiết bị : Iphone 13 pro max',
            'assets/images/Yeti.png',
            kYellowColor,
          ),
          SizedBox(
            height: 20,
          ),
          DetailCard(
            'Nguyễn Văn C',
            'Thiết bị : PC',
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
