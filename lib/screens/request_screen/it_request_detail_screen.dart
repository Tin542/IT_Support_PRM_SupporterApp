import 'package:flutter/material.dart';
import 'package:it_support/models/request.dart';

import '../../constant.dart';

class DetailRequestScreen extends StatelessWidget {
  final Request request;
  const DetailRequestScreen({Key? key, required this.request})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chi tiết yêu cầu")),
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: ClampingScrollPhysics(),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Thiết bị",
                  ),
                  initialValue: request.device),
              SizedBox(height: 30),
              TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "ID teamView",
                  ),
                  initialValue: request.idTeamView),
              SizedBox(height: 30),
              TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password teamView",
                  ),
                  initialValue: request.passTeamView),
              SizedBox(height: 30),
              TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Vấn đề",
                  ),
                  initialValue: request.problem),
              SizedBox(height: 30),
              TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Chi tiết vấn đề",
                  ),
                  initialValue: request.description),
              SizedBox(height: 30),
              TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Trạng thái",
                  ),
                  initialValue: request.status),
                   SizedBox(height: 30),
              TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email khách hàng",
                  ),
                  initialValue: request.userEmail),
            ],
          ),
        ),
      ),
    );
  }
}