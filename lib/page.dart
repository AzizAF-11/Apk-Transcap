import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_travel_3/descriptionPromo.dart';
import 'package:flutter_application_travel_3/pemesanan.dart';
import 'package:flutter_application_travel_3/promoScreen.dart';
import 'package:flutter_application_travel_3/provider_profile.dart';
import 'package:provider/provider.dart';

class Food {
  String title;
  String image;
  String description;
  String description2;
  IconData icon;
  Food(
      {required this.title,
      required this.image,
      required this.icon,
      required this.description,
      required this.description2});
}

// ignore: must_be_immutable
class AddProductPage extends StatefulWidget {
  static const String route = "/add_product";

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  List<Food> _promoList = [];

  @override
  void initState() {
    super.initState();
    _initPromoList();
  }

  void _initPromoList() {
    _promoList.add(
      Food(
        title: "Berlaku hingga 2 februari 2024",
        image: "assets/images/KotaBandung.jpeg",
        icon: Icons.calendar_month,
        description: "New Outlet CapTrans Bandung",
        description2:
            'Kini lebih mudah ke Bandung Outlets dengan Citrans Reguler! Lebih hemat dan nyaman',
      ),
    );
    _promoList.add(
      Food(
        title: "Berlaku hingga 31 Januari 2024",
        image: "assets/images/KotaBandung.jpeg",
        icon: Icons.calendar_month,
        description: "New Outlet CapTrans Bandung",
        description2:
            'Kini lebih mudah ke Bandung Outlets dengan Citrans Reguler! Lebih hemat dan nyaman',
      ),
    );
    _promoList.add(
      Food(
        title: "Berlaku hingga 21 Januari 2024",
        image: "assets/images/KotaBandung.jpeg",
        icon: Icons.calendar_month,
        description: "New Route! Semarang-Bandung",
        description2:
            'Semakin nyaman dan mudah ke Bandung langsung dari Semarang bareng Citrans, tanpa transit, yang pasti full toll dan gratis snack. Ayo pesan tiket sekarang',
      ),
    );
    _promoList.add(
      Food(
        title: "Berlaku hingga 14 Januari 2024",
        image: "assets/images/KotaBandung.jpeg",
        icon: Icons.calendar_month,
        description: "CapTrans Reguler",
        description2:
            'Kini Kamu bisa lebih hemat dan lebih banyak pilihan rute untuk ke jakarta atau bandung hanya dengan Rp 120.000',
      ),
    );
    _promoList.add(
      Food(
        title: "Berlaku hingga 26 Januari 2024",
        image: "assets/images/KotaBandung.jpeg",
        icon: Icons.calendar_month,
        description: "Promo Semarang-Jakarta",
        description2:
            'Semakin nyaman dan mudah ke Bandung langsung dari Semarang bareng Citrans, tanpa transit, yang pasti full toll dan gratis snack. Ayo pesan tiket sekarang',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    // Implement the UI for AddProductPage
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TRANSCAP',
          style: TextStyle(fontFamily: "CaveatBrush", fontSize: 31.5),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              children: [
                Text(
                  userProvider.name.isNotEmpty ? userProvider.name : 'User',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  radius: 15,
                  child: Consumer<UserProvider>(
                    builder: (context, userProvider, child) {
                      return CircleAvatar(
                        radius: 25,
                        backgroundImage: userProvider.profileImage.isNotEmpty
                            ? FileImage(File(userProvider.profileImage))
                                as ImageProvider
                            : AssetImage('assets/images/KotaBandung.jpeg'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Color(0xFF26425A),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildPilihRute(context),
                _buildGoFoodFeatured(),
                // Add other widgets as needed
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF86A8CF),
    );
  }

  Widget _buildGoFoodFeatured() {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Promo masih berlangsung",
                style: TextStyle(
                  fontFamily: "NeoSansBold",
                  fontSize: 17,
                  color: Color(0xFF26425A),
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PromoScreen(Listpromo: _promoList)),
                  );
                },
                child: Text(
                  "Selengkapnya",
                  style: TextStyle(
                    fontFamily: "NeoSansBold",
                    fontSize: 14,
                    color: Color(0xFF26425A),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          SizedBox(
            height: 220.0,
            child: ListView.builder(
              itemCount: _promoList.length,
              padding: EdgeInsets.only(top: 12.0),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _rowGoFoodFeatured(context, _promoList[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _rowGoFoodFeatured(BuildContext context, Food food) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DeskripsiPromoScreen(food: food),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 225, 220, 220),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 90, 85, 85).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(3, 0), // pergeseran bayangan dari objek
            ),
          ],
        ),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(right: 11.0, bottom: 8, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                food.image,
                width: 200.0,
                height: 140.0,
                alignment: Alignment.topCenter,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  food.icon,
                  size: 20.0,
                  color: Colors.amber,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.0),
                ),
                Text(
                  food.title,
                  style: TextStyle(fontSize: 12, color: Colors.amber),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              food.description,
              style: TextStyle(fontSize: 12, color: Color(0xFF26425A)),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPilihRute(BuildContext context) {
  return new Container(
    // color: Colors.white,
    padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: new Text(
            "Pilih Rute",
            style: new TextStyle(
                fontFamily: "NeoSansBold",
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Color(0xFF26425A)),
            textAlign: TextAlign.center,
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 5.0),
        ),
        new SizedBox(
          height: 380,
          width: 400,
          child: ListView(
            padding: EdgeInsets.only(top: 12.0),
            scrollDirection: Axis.horizontal,
            children: List.generate(
              3, // Ganti dengan jumlah item yang ingin ditampilkan (misalnya 2)
              (index) {
                if (index == 0) {
                  return _TujuanBandung(context);
                } else if (index == 1) {
                  return _TujuanSemarang(context);
                } else if (index == 2) {
                  return _TujuanJakarta(context);
                }
                return Container(); // Mengembalikan Container kosong jika indeks tidak sesuai
              },
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _TujuanBandung(BuildContext context) {
  return Container(
    height: 350,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 225, 220, 220),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 90, 85, 85).withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(3, 0), // pergeseran bayangan dari objek
        ),
      ],
    ),
    margin: EdgeInsets.only(left: 5, right: 20, bottom: 5),
    padding: EdgeInsets.only(bottom: 10),
    child: Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          child: Image.asset(
            'assets/images/KotaBandung.jpeg',
            width: 270,
            height: 180,
            alignment: Alignment.topCenter,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Bandung',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 19,
                      color: const Color.fromARGB(255, 90, 86, 86),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Dipati Ukur',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 90, 86, 86),
                          fontSize: 13),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 19,
                      color: const Color.fromARGB(255, 90, 86, 86),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Buah Batu',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 90, 86, 86)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 60), // Menambahkan jarak antara dua Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 19,
                      color: const Color.fromARGB(255, 90, 86, 86),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Pasteur',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 90, 86, 86)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 19,
                      color: const Color.fromARGB(255, 90, 86, 86),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Dipati Ukur',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 90, 86, 86)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Spacer(), // Menambahkan ruang antara teks dan tombol
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PemesananScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(200, 30),
            ),
            child: Text('Pesan'),
          ),
        ),
      ],
    ),
  );
}

Widget _TujuanSemarang(BuildContext context) {
  return new Container(
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 225, 220, 220),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 90, 85, 85).withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(3, 0), // pergeseran bayangan dari objek
        ),
      ],
    ),
    margin: EdgeInsets.only(right: 20, bottom: 5),
    padding: EdgeInsets.only(bottom: 10),
    child: Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          child: Image.asset(
            'assets/images/KotaBandung.jpeg',
            width: 270,
            height: 180,
            alignment: Alignment.topCenter,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Semarang',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 19,
                      color: const Color.fromARGB(255, 90, 86, 86),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Ungaran',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 90, 86, 86),
                          fontSize: 13),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 19,
                      color: const Color.fromARGB(255, 90, 86, 86),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Pandanaran',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 90, 86, 86)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 19,
                      color: const Color.fromARGB(255, 90, 86, 86),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Pandanaran',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 90, 86, 86)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 60), // Menambahkan jarak antara dua Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 19,
                      color: const Color.fromARGB(255, 90, 86, 86),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Bawen',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 90, 86, 86)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 19,
                      color: const Color.fromARGB(255, 90, 86, 86),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Kota Lama',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 90, 86, 86)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [Text('')],
                )
              ],
            ),
          ],
        ),
        Spacer(), // Menambahkan ruang antara teks dan tombol
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(150, 30), // Mengatur panjang dan lebar tombol
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PemesananScreen()),
            );
          },
          child: Text('Pesan'),
        )
      ],
    ),
  );
}

Widget _TujuanJakarta(BuildContext context) {
  return new Container(
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 225, 220, 220),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 90, 85, 85).withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(3, 0), // pergeseran bayangan dari objek
        ),
      ],
    ),
    margin: EdgeInsets.only(right: 10, bottom: 10),
    padding: EdgeInsets.only(bottom: 10),
    child: Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          child: Image.asset(
            'assets/images/KotaBandung.jpeg',
            width: 270,
            height: 180,
            alignment: Alignment.topCenter,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Jakarta',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 19,
                      color: const Color.fromARGB(255, 90, 86, 86),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Central Park',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 90, 86, 86),
                          fontSize: 13),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 19,
                      color: const Color.fromARGB(255, 90, 86, 86),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Fatmawati',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 90, 86, 86)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 19,
                      color: const Color.fromARGB(255, 90, 86, 86),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Kelapa Gading',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 90, 86, 86)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 35), // Menambahkan jarak antara dua Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 19,
                      color: const Color.fromARGB(255, 90, 86, 86),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'SCBD',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 90, 86, 86)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 19,
                      color: const Color.fromARGB(255, 90, 86, 86),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Pacific Place',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 90, 86, 86)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [Text('')],
                )
              ],
            ),
          ],
        ),
        Spacer(), // Menambahkan ruang antara teks dan tombol
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(150, 30), // Mengatur panjang dan lebar tombol
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PemesananScreen()),
            );
          },
          child: Text('Pesan'),
        )
      ],
    ),
  );
}

// class PemesananScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Form Pemesanan'),
//       ),
//       body: Center(
//         child: Text('Isi formulir pemesanan di sini'),
//       ),
//     );
//   }
// }
