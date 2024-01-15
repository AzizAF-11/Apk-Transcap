import 'package:flutter/material.dart';

class screen_inbox extends StatefulWidget {
  @override
  _screen_inbokState createState() => _screen_inbokState();
}

class _screen_inbokState extends State<screen_inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF26425A),
          foregroundColor: Colors.white,
          title: Center(
              child: Text(
            'Kotak Masuk',
            style: TextStyle(fontSize: 18),
          )),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/not_found.png', // Replace with the path to your image asset
                  width: 180, // Adjust the width as needed
                  height: 200, // Adjust the height as needed
                ),
                SizedBox(height: 4),
                Text(
                  'Belum ada pesan',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ));
  }
}
