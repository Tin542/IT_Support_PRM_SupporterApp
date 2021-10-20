import 'package:flutter/material.dart';
import 'package:it_support/constant.dart';
import 'package:it_support/screens/components/request_card.dart';

class RequestScreen extends StatelessWidget {
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Chúng tôi có vài vấn đề !',
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
              buildRequestList(),
            ],
          ),
        ),
      ),
    );
  }

  buildRequestList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          RequestCard(
            'Le Thi A',
            'Devices: Macbook Pro 16\nProblem: How to install Windown on MacOS.',
            'assets/images/Yeti.png',
            kBlueColor,
          ),
          SizedBox(
            height: 20,
          ),
          RequestCard(
            'Le Thi B',
            'Devices: Laptop MSI\nProblem: My computer cannot connect to the Internet.',
            'assets/images/Yeti.png',
            kYellowColor,
          ),
          SizedBox(
            height: 20,
          ),
          RequestCard(
            'Le Thi C',
            'Devices: Iphone 13\nProblem: My phone hangs.',
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
