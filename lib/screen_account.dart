import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_travel_3/auth.dart';
import 'package:flutter_application_travel_3/auth_page.dart';
import 'package:flutter_application_travel_3/edit_profil.dart';
import 'package:flutter_application_travel_3/provider_profile.dart';
import 'package:provider/provider.dart';

class profile {
  final String name;
  final String phoneNumber;
  final String email;
  final String profileImage;

  profile({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.profileImage,
  });
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Akun',
            style: TextStyle(fontSize: 17),
          ),
        ),
        backgroundColor: Color(0xFF26425A),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue[200],
                borderRadius: BorderRadius.circular(60),
              ),
              height: 130,
              padding:
                  EdgeInsets.only(top: 16, left: 15, right: 12, bottom: 12),
              margin: EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Consumer<UserProvider>(
                      builder: (context, userProvider, child) {
                        return CircleAvatar(
                          radius: 60,
                          backgroundImage: userProvider.profileImage.isNotEmpty
                              ? FileImage(File(userProvider.profileImage))
                                  as ImageProvider
                              : AssetImage('assets/images/KotaBandung.jpeg'),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        userProvider.name.isNotEmpty
                            ? userProvider.name
                            : 'User',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        userProvider.phoneNumber.isNotEmpty
                            ? userProvider.phoneNumber
                            : '08123456789',
                      ),
                      Text(userProvider.email.isNotEmpty
                          ? userProvider.email
                          : 'user@gmail.com'),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(
                            name: userProvider.name,
                            phoneNumber: userProvider.phoneNumber,
                            email: userProvider.email,
                            profileImage: userProvider.profileImage,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_city_rounded,
                            color: Color(0xFF26425A),
                            size: 30,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Tentang Citrans',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_city_rounded,
                            color: Color(0xFF26425A),
                            size: 30,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Syarat & Ketentuan',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: () async {
                      // Tambahkan logika keluar/logout di sini
                      Provider.of<Auth>(context, listen: false).logout();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.logout_outlined,
                              color: Colors.red,
                              size: 26,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Keluar',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
