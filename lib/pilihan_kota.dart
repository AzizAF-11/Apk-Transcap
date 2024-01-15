import 'package:flutter/material.dart';

class Kota {
  final String nama;
  final String deskripsi;
  final String kota;

  Kota({required this.nama, required this.deskripsi, required this.kota});
}

class PilihanKotaPage extends StatelessWidget {
  final List<String> daftarKota = [
    'Bandung',
    'Jakarta',
    'Semarang',
    // Tambahkan kota lainnya sesuai kebutuhan
  ];

  final List<Kota> daftarLokasi = [
    Kota(
      kota: 'Bandung',
      nama: 'Dipati Ukur',
      deskripsi: 'jl. Dipati Ukur No.23, Bandung',
    ),
    Kota(
      kota: 'Bandung',
      nama: 'Pasteur',
      deskripsi: 'jl. Dr. Djunjunan No.134, Pajajaran',
    ),
    Kota(
      kota: 'Bandung',
      nama: 'Buah Batu',
      deskripsi: 'Pool Bluebird Buah Batu',
    ),
    Kota(
      kota: 'Semarang',
      nama: 'Kesatrian',
      deskripsi: 'jl. Teuku Umar no 34 Jatingaleh, Semarang',
    ),
    Kota(
      kota: 'Jakarta',
      nama: 'SCBD',
      deskripsi: 'Drand Lucky SCBD',
    ),
    Kota(
      kota: 'Jakarta',
      nama: 'Kelapa Gading',
      deskripsi: 'Jalan Hansen Barat No.17, Jakarta',
    ),
    // Tambahkan lokasi lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Kota'),
        backgroundColor: Color(0xFF26425A),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: Color.fromARGB(255, 65, 105, 141),
              ),
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.only(left: 15, top: 8, bottom: 8),
              child: Text(
                'Kota',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: daftarKota.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text(daftarKota[index], style: TextStyle(fontSize: 15)),
                  subtitle: Text(
                    'All Shelter / boarding point in ${daftarKota[index]}',
                    style: TextStyle(fontSize: 13),
                  ),
                  onTap: () {
                    // Mengembalikan kota terpilih ke halaman sebelumnya
                    Navigator.pop(context, daftarKota[index]);
                  },
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: Color.fromARGB(255, 65, 105, 141),
              ),
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.only(left: 15, top: 8, bottom: 8),
              child: Text(
                'Lokasi Pemberhentian atau Keberangkatan',
                style: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 16.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: daftarLokasi.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      '[${daftarLokasi[index].kota}] ${daftarLokasi[index].nama}',
                      style: TextStyle(fontSize: 14.5)),
                  subtitle: Text(
                    '${daftarLokasi[index].deskripsi}',
                    style: TextStyle(fontSize: 12),
                  ),
                  onTap: () {
                    // Mengembalikan kota terpilih ke halaman sebelumnya
                    Navigator.pop(context, daftarLokasi[index].nama);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
