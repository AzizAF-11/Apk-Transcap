// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF26425A),
        title: Text(
          'Pembayaran',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              size: 21,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Pilih Metode Pembayaran',
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PaymentCard(
                  paymentMethod: 'PayPal',
                  onPressed: () {
                    // Tambahkan logika untuk pembayaran PayPal
                  },
                ),
                SizedBox(width: 20),
                PaymentCard(
                  paymentMethod: 'QRIS',
                  onPressed: () {
                    tampilkanKonfirmasiPembayaranQRIS(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  final String paymentMethod;
  final VoidCallback onPressed;

  const PaymentCard({
    required this.paymentMethod,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 150,
          height: 150,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                paymentMethod == 'PayPal' ? Icons.payment : Icons.qr_code,
                size: 45,
                color: Color(0xFF26425A),
              ),
              SizedBox(height: 10),
              Text(
                paymentMethod,
                style: TextStyle(fontSize: 22, fontFamily: 'CaveatBrush'),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void tampilkanKonfirmasiPembayaranQRIS(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Konfirmasi Pembayaran QRIS', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
        content: Text('Apakah Anda ingin melanjutkan pembayaran QRIS?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Tutup dialog
              Navigator.of(context).pop();

              // Tampilkan tampilan baru dengan QR code untuk membuka aplikasi DANA
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => QrCodeScreen(),
                ),
              );
            },
            child: Text('Ya'),
          ),
          TextButton(
            onPressed: () {
              // Tutup dialog
              Navigator.of(context).pop();
            },
            child: Text('Tidak'),
          ),
        ],
      );
    },
  );
}

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  final String waNumber = '6281325766805'; // Ganti dengan nomor WA yang sesuai

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF26425A),
        title: Text(
          'QR Code',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              size: 21,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            QrImageView(
              data: 'https://qr.dana.id/v1/281012012022070534585451',
              size: 200.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Jika sudah melakukan pembayaran screenshot bukti pembayaran kemudian kirim ke WhatsApp dibawah',
              style: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                // Tambahkan logika untuk membuka aplikasi WA
                _openWhatsApp();
              },
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.message,
                        size: 30,
                        color: Colors.green,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'WhatsApp',
                        style: TextStyle(fontSize: 19, fontFamily: 'CaveatBrush'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuka aplikasi WhatsApp
  void _openWhatsApp() async {
    final whatsappUrl = "https://wa.me/$waNumber";
    // ignore: deprecated_member_use
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      // Jika tidak dapat membuka aplikasi WhatsApp, Anda dapat memberikan pesan atau mengambil tindakan lain
      print('Tidak dapat membuka WhatsApp');
    }
  }
}
