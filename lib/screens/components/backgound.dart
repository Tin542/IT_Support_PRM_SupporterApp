import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[child],
          )),
    );
  }
}
