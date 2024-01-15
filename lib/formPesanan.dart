import 'package:flutter/material.dart';
import 'package:flutter_application_travel_3/dataBandungJkt.dart';
import 'package:flutter_application_travel_3/dataSmgBandung.dart';
import 'package:flutter_application_travel_3/service_pesanan.dart';
import 'package:flutter_application_travel_3/tampil_pesanan.dart';

// Form Semarang ke Bandung Atau Sebaliknya

class FormPesanan extends StatefulWidget {
  final Pool pool;
  final Pool2 pool2;
  final String tanggalBerangkat;
  final int jumlahKursi;

  FormPesanan(
      {required this.pool,
      required this.tanggalBerangkat,
      required this.jumlahKursi,
      required this.pool2});

  @override
  _FormPesananState createState() => _FormPesananState();
}

class _FormPesananState extends State<FormPesanan> {
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController nomorTeleponController = TextEditingController();
  TextEditingController tanggalPesananController = TextEditingController();
  TextEditingController jamBerangkatController = TextEditingController();
  TextEditingController jamSampaiController = TextEditingController();
  TextEditingController jumlahKursiController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController kotaAwalController = TextEditingController();
  TextEditingController kotaTujuanController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Inisialisasi controller dengan data dari objek pool
    tanggalPesananController.text = widget.tanggalBerangkat.toString();
    jamBerangkatController.text = widget.pool.jamBrngkt;
    jamSampaiController.text = widget.pool.jamSampai;
    jumlahKursiController.text = widget.jumlahKursi.toString();
    hargaController.text = widget.pool.harga;
    kotaAwalController.text = widget.pool.kotaAwal;
    kotaTujuanController.text = widget.pool.KotaTujuan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form Pesanan',
          style: TextStyle(color: Colors.white, fontSize: 19.5),
        ),
        backgroundColor: Color(0xFF26425A),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: namaLengkapController,
                  decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey))),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: nomorTeleponController,
                  decoration: InputDecoration(
                      labelText: 'Nomor Telepon',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey))),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: tanggalPesananController,
                  decoration: InputDecoration(
                      labelText: 'Tanggal Pesanan',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey))),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: jamBerangkatController,
                  decoration: InputDecoration(
                      labelText: 'Jam Berangkat',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey))),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: jamSampaiController,
                  decoration: InputDecoration(
                      labelText: 'Jam Sampai',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey))),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: jumlahKursiController,
                  decoration: InputDecoration(
                      labelText: 'Jumlah Kursi',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey))),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: hargaController,
                  decoration: InputDecoration(
                      labelText: 'Harga',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey))),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: kotaAwalController,
                  decoration: InputDecoration(
                      labelText: 'Kota Awal',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey))),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: kotaTujuanController,
                  decoration: InputDecoration(
                      labelText: 'Kota Tujuan',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey))),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    String namaLengkap = namaLengkapController.text;
                    String nomorTelepon = nomorTeleponController.text;
                    String tanggalPesanan = tanggalPesananController.text;
                    String jamBerangkat = jamBerangkatController.text;
                    String jamSampai = jamSampaiController.text;
                    String jumlahKursi = jumlahKursiController.text;
                    String harga = hargaController.text;
                    String kotaAwal = kotaAwalController.text;
                    String kotaTujuan = kotaTujuanController.text;

                    await PesananStorage.simpanPesanan(
                      namaLengkap: namaLengkap,
                      nomorTelepon: nomorTelepon,
                      tanggalPesanan: tanggalPesanan,
                      jamBerangkat: jamBerangkat,
                      jamSampai: jamSampai,
                      jumlahKursi: jumlahKursi,
                      harga: harga,
                      kotaAwal: kotaAwal,
                      kotaTujuan: kotaTujuan,
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TampilPesananPage(),
                      ),
                    );
                  },
                  child: Text('Buat Pesanan'),
                ),
              ],
            ),
          
        ),
      ),
    );
  }
}
