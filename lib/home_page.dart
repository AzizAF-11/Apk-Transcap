import 'package:flutter/material.dart';
import 'package:flutter_application_travel_3/auth.dart';
import 'package:flutter_application_travel_3/inbox.dart';
import 'package:flutter_application_travel_3/page.dart';
import 'package:flutter_application_travel_3/pesanan.dart';
import 'package:flutter_application_travel_3/screen_account.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const route = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [
    new AddProductPage(),
    new PesananPage(),
    new screen_inbox(),
    new AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Menggunakan Consumer untuk mendengarkan perubahan di objek Auth
    return Consumer<Auth>(
      builder: (context, auth, child) {
        return Scaffold(
          body: _container[_bottomNavCurrentIndex],
          bottomNavigationBar: _buildBottomNavigation(),
        );
      },
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _bottomNavCurrentIndex = index;
        });
      },
      currentIndex: _bottomNavCurrentIndex,
      items: [
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.home,
            color: Color(0xFF26425A),
          ),
          icon: new Icon(
            Icons.home,
            color: Colors.grey,
            size: 30,
          ),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.assignment,
            color: Color(0xFF26425A),
          ),
          icon: new Icon(
            Icons.assignment,
            color: Colors.grey,
            size: 30,
          ),
          label: 'Pesanan',
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.mail,
            color: Color(0xFF26425A),
          ),
          icon: new Icon(
            Icons.mail,
            color: Colors.grey,
            size: 30,
          ),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.person,
            color: Color(0xFF26425A),
          ),
          icon: new Icon(
            Icons.person,
            color: Colors.grey,
            size: 30,
          ),
          label: 'Akun',
        ),
      ],
      fixedColor: Color(0xFF26425A),
    );
  }
}
