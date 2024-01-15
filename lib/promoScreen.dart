import 'package:flutter/material.dart';
import 'package:flutter_application_travel_3/descriptionPromo.dart';
import 'package:flutter_application_travel_3/page.dart';

class PromoScreen extends StatelessWidget {
  final List<Food> Listpromo;

  PromoScreen({required this.Listpromo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Promo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFF26425A),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Listpromo.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DeskripsiPromoScreen(food: Listpromo[index]),
                  ),
                );
              },
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 225, 220, 220),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 90, 85, 85)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      // offset: Offset(3, 0), // pergeseran bayangan dari objek
                    ),
                  ],
                ),
                padding: EdgeInsets.all(8),
                margin:
                    EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        Listpromo[index].image,
                        width: double
                            .infinity, // Set lebar gambar agar memenuhi area kosong
                        height: 175.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Listpromo[index].icon,
                          size: 20.0,
                          color: Colors.amber,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.0),
                        ),
                        Text(
                          Listpromo[index].title,
                          style: TextStyle(fontSize: 15, color: Colors.amber),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      Listpromo[index].description,
                      style: TextStyle(fontSize: 14, color: Color(0xFF26425A), fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
