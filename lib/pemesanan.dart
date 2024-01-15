import 'package:flutter/material.dart';
import 'package:flutter_application_travel_3/dataBandungJkt.dart';
import 'package:flutter_application_travel_3/dataSmgBandung.dart';
import 'package:flutter_application_travel_3/formPesanan.dart';
import 'package:flutter_application_travel_3/pilihan_kota.dart';
import 'package:intl/intl.dart';

class PemesananScreen extends StatefulWidget {
  @override
  _PemesananScreenState createState() => _PemesananScreenState();
}

class _PemesananScreenState extends State<PemesananScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _tanggalBerangkatController = TextEditingController();

  String kotaAwal = '';
  String kotaTujuan = '';
  DateTime? tanggalBerangkat;
  int jumlahKursi = 1;

  // Contoh daftar rute yang tersedia
  List<String> ruteTersedia = [
    'Bandung ke Jakarta',
    'Semarang ke Jakarta',
    'Semarang ke Bandung'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Pemesanan',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          backgroundColor: Color(0xFF26425A),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Kota Awal',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onTap: () {
                    // Panggil fungsi navigasi ke halaman pemilihan kota
                    _pindahKeHalamanPilihanKota(context);
                  },
                  readOnly: true, // Text field hanya bisa dibaca
                  controller: TextEditingController(text: kotaAwal),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          BorderSide(color: Color(0xFF26425A), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Kota Tujuan',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onTap: () {
                    // Panggil fungsi navigasi ke halaman pemilihan kota
                    _pindahKeHalamanPilihanKota2(context);
                  },
                  readOnly: true, // Text field hanya bisa dibaca
                  controller: TextEditingController(text: kotaTujuan),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          BorderSide(color: Color(0xFF26425A), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Tanggal Berangkat',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _tanggalBerangkatController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          BorderSide(color: Color(0xFF26425A), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  onTap: () async {
                    DateTime? tanggalDipilih = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (tanggalDipilih != null) {
                      // Format tanggal tanpa jam atau waktu
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(tanggalDipilih);
      
                      // Update nilai teks secara langsung menggunakan kontroler
                      _tanggalBerangkatController.text = formattedDate;
                    }
                  },
                  validator: (value) {
                    if (_tanggalBerangkatController.text.isEmpty) {
                      return 'Tanggal Berangkat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Jumlah Kursi',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          BorderSide(color: Color(0xFF26425A), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null ||
                        int.parse(value) <= 0) {
                      return 'Jumlah Kursi tidak valid';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    jumlahKursi = int.parse(value!);
                  },
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
      
                      String rute = '$kotaAwal ke $kotaTujuan';
      
                      // Periksa apakah rute ada dalam daftar ruteTersedia
                      int index = ruteTersedia.indexOf(rute);
      
                      if (index != -1) {
                        // Jika rute ada, navigasi ke layar yang sesuai dengan indeks rute
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              switch (index) {
                                case 0:
                                  return LayarRute2(
                                    jumlahKursi: jumlahKursi,
                                    tanggalBerangkat:
                                        _tanggalBerangkatController.text,
                                  );
                                case 1:
                                  return LayarRute1();
                                case 2:
                                  return LayarRuteTersedia(
                                    jumlahKursi: jumlahKursi,
                                    tanggalBerangkat:
                                        _tanggalBerangkatController.text,
                                  );
                                // Tambahkan kasus lainnya sesuai kebutuhan
                                default:
                                  return LayarRuteTersedia(
                                    jumlahKursi: jumlahKursi,
                                    tanggalBerangkat:
                                        _tanggalBerangkatController.text,
                                  );
                              }
                            },
                          ),
                        );
                      } else {
                        // Jika rute tidak ada, tampilkan pesan kesalahan atau tangani sesuai kebutuhan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScreenNotFound(
                              kotaAwal: kotaAwal,
                              kotaTujuan: kotaTujuan,
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Cari'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pindahKeHalamanPilihanKota(BuildContext context) async {
    final kotaTerpilih = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PilihanKotaPage()),
    );

    if (kotaTerpilih != null) {
      setState(() {
        // Update nilai kotaAwal ketika kota terpilih
        kotaAwal = kotaTerpilih;
      });
    }
  }

  void _pindahKeHalamanPilihanKota2(BuildContext context) async {
    final kotaTerpilih = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PilihanKotaPage()),
    );

    if (kotaTerpilih != null) {
      setState(() {
        // Update nilai kotaAwal ketika kota terpilih
        kotaTujuan = kotaTerpilih;
      });
    }
  }
}

class ScreenNotFound extends StatelessWidget {
  late final String kotaAwal;
  late final String kotaTujuan;

  ScreenNotFound({required this.kotaAwal, required this.kotaTujuan});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('$kotaAwal ke $kotaTujuan', style: TextStyle(fontSize: 18.5),),
          backgroundColor: Color(0xFF26425A),
          foregroundColor: Colors.white,
        ),
        body: Center(
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
                'Rute tidak ditemukan',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LayarRuteTersedia extends StatelessWidget {
  final int jumlahKursi;
  final String tanggalBerangkat;

  LayarRuteTersedia(
      {required this.jumlahKursi, required this.tanggalBerangkat});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF26425A),
          title: Text(
            'Semarang ke Bandung',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 70,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF26425A)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Tanggal Berangkat : $tanggalBerangkat',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Color(0xFF26425A)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Jumlah Kursi  : $jumlahKursi',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Color(0xFF26425A)),
                    ),
                    // Tambahkan widget lain sesuai kebutuhan
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: semarangBandungData
                      .length, // Ganti dengan jumlah item yang sesuai
                  itemBuilder: (context, index) {
                    var Tujuan = semarangBandungData[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormPesanan(
                                pool: semarangBandungData[index],
                                jumlahKursi: jumlahKursi,
                                tanggalBerangkat: tanggalBerangkat,
                                pool2: BandungJakartaData[index]),
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                            Tujuan.jenis,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Tujuan.jamBrngkt,
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        Tujuan.selisihJam,
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.amber),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        Tujuan.jamSampai,
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
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
                                    ],
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(Tujuan.kotaAwal),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Text(Tujuan.KotaTujuan),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Rp. ${Tujuan.harga}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    'Tersedia',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                        color: Colors.amber),
                                  ),
                                  Text(
                                    Tujuan.kursi,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LayarRute1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semarang ke Jakarta'),
      ),
      body: Center(
        child: Text('Daftar rute1 yang tersedia akan ditampilkan di sini'),
      ),
    );
  }
}

class LayarRute2 extends StatelessWidget {
  late final int jumlahKursi;
  late final String tanggalBerangkat;

  LayarRute2({required this.jumlahKursi, required this.tanggalBerangkat});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF26425A),
          title: Text(
            'Bandung ke Jakarta',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 70,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF26425A)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Tanggal Berangkat : $tanggalBerangkat',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Color(0xFF26425A)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Jumlah Kursi  : $jumlahKursi',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Color(0xFF26425A)),
                    ),
                    // Tambahkan widget lain sesuai kebutuhan
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: BandungJakartaData
                      .length, // Ganti dengan jumlah item yang sesuai
                  itemBuilder: (context, index) {
                    var Tujuan = BandungJakartaData[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormPesanan(
                              pool2: BandungJakartaData[index],
                              jumlahKursi: jumlahKursi,
                              tanggalBerangkat: tanggalBerangkat,
                              pool: semarangBandungData[index],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                            Tujuan.jenis,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Tujuan.jamBrngkt,
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        Tujuan.selisihJam,
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.amber),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        Tujuan.jamSampai,
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
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
                                    ],
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(Tujuan.kotaAwal),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Text(Tujuan.KotaTujuan),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Rp. ${Tujuan.harga}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    'Tersedia',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                        color: Colors.amber),
                                  ),
                                  Text(
                                    Tujuan.kursi,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
