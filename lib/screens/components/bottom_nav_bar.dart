import 'package:flutter/material.dart';
import 'package:it_support/constant.dart';
import 'package:it_support/screens/History_screen/waiting_list.dart';
import 'package:it_support/screens/home_screen.dart';
import 'package:it_support/screens/request_screen/it_request_list_screen.dart';
import 'package:it_support/screens/chat_screen/list_chat_screen.dart';
import 'package:it_support/screens/profile_screen/profile_screen.dart';
import 'package:it_support/waiting_payment/waiting_payment_screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final screens = [
    HomeScreenCustomer(),
    listrequest(),
    waitingscreen(),
    waitingpayment(),
    ListChatScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: SizedBox(
          height: 45,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: kBackgroundColor,
            selectedItemColor: kBlueColor,
            showUnselectedLabels: false,
            iconSize: 25,
            selectedFontSize: 8,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Trang chủ",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted),
                label: "Danh sách yêu cầu",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: "Danh sách chờ"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.payment), label: "Danh sách thanh toán"),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: "Trò truyện",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Hồ Sơ",
              ),
            ],
          ),
        ),
      );
}
