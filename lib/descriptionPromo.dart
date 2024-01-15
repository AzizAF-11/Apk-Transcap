import 'package:flutter/material.dart';
import 'package:flutter_application_travel_3/page.dart';

class DeskripsiPromoScreen extends StatelessWidget {
  final Food food;

  DeskripsiPromoScreen({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack untuk menumpuk elemen
            Stack(
              children: [
                // Gambar di bagian atas
                Image.asset(
                  food.image,
                  width: double.infinity,
                  height: 270.0,
                  fit: BoxFit.fill,
                ),
                // Tombol kembali di bagian atas kiri
                Positioned(
                  top: 20,
                  left: 10,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(10.0)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      overlayColor: MaterialStateProperty.all<Color>(
                          Color(0xFF26425A).withOpacity(0.5)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
                // Kontainer menutupi sebagian dari gambar di bagian bawah
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 25, // Sesuaikan tinggi sesuai kebutuhan
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.white,
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 15, left: 15, top: 0, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.description,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF26425A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        food.icon,
                        size: 24.0,
                        color: Colors.amber,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.0),
                      ),
                      Text(
                        food.title,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.amber,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    food.description2,
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Color(0xFF26425A),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.justify,
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

