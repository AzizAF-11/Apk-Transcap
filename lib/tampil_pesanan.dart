import 'package:flutter/material.dart';
import 'package:flutter_application_travel_3/home_page.dart';
import 'package:flutter_application_travel_3/payment.dart';
import 'package:flutter_application_travel_3/service_pesanan.dart';

class TampilPesananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF26425A),
        title: Text(
          'Detail Pesanan',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, size: 21,),
            onPressed: () {
              // Pindah ke halaman Homepage() setelah menutup halaman TampilPesananPage()
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
                // (route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 17, left: 17),
        child: FutureBuilder<Map<String, String>>(
          future: PesananStorage.getPesanan(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              double harga = double.parse(snapshot.data?['harga'] ?? '0');
              int jumlahKursi = int.parse(snapshot.data?['jumlahKursi'] ?? '0');
              double totalPembayaran = harga * jumlahKursi;
              // Tampilkan detail pesanan pada halaman
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Penumpang',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.5),
                          ),
                          Text(
                            '${snapshot.data?['namaLengkap']}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Nomor Telepon',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.5),
                          ),
                          Text(
                            '${snapshot.data?['nomorTelepon']}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tanggal Keberangkatan',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.5),
                          ),
                          Text(
                            '${snapshot.data?['tanggalPesanan']}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          SizedBox(
                            height: 55,
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.circle_outlined,
                                size: 10,
                              ),
                              Text('|'),
                              Text('|'),
                              SizedBox(
                                height: 4,
                              ),
                              Icon(
                                Icons.circle,
                                size: 10,
                              ),
                              SizedBox(
                                height: 16,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Waktu Keberangkatan',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.5),
                              ),
                              Text(
                                '${snapshot.data?['jamBerangkat']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              SizedBox(
                                height: 17,
                              ),
                              Text(
                                'Waktu Sampai',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.5),
                              ),
                              Text(
                                '${snapshot.data?['jamSampai']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 48,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rute :',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '${snapshot.data?['kotaAwal']} - ${snapshot.data?['kotaTujuan']}',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 53,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Harga per tiket',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 13),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'jumlah kursi yang dipesan',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 13),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Rp ${snapshot.data?['harga']}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 13),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${snapshot.data?['jumlahKursi']}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 13),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total Pembayaran',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.5,
                                color: Colors.amber),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Rp ${totalPembayaran.toStringAsFixed(3)}', // Menampilkan hasil perkalian
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors
                                  .amber, // Anda bisa menyesuaikan warna teks
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic to handle payment here
                      // For example, you can navigate to a payment screen
                      // or show a payment dialog.
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue, // Set the text color
                      padding: EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10), // Set padding
                      textStyle: TextStyle(fontSize: 16), // Set the text size
                    ),
                    child: Text('Bayar'),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
