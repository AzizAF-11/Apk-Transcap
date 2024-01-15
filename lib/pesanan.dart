import 'package:flutter/material.dart';
import 'service_pesanan.dart'; // Import file pesanan.dart untuk menggunakan PesananStorage

class PesananPage extends StatefulWidget {
  @override
  _PesananPageState createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  Future<List<Map<String, String>>>? _riwayatPesananFuture;

  @override
  void initState() {
    super.initState();
    _loadRiwayatPesanan();
  }

  Future<void> _loadRiwayatPesanan() async {
    setState(() {
      _riwayatPesananFuture = PesananStorage.getRiwayatPesanan();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Riwayat Pesanan', style: TextStyle(fontSize: 17))),
        backgroundColor: Color(0xFF26425A),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: FutureBuilder<List<Map<String, String>>>(
          future: _riwayatPesananFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Map<String, String>> riwayatPesanan = snapshot.data ?? [];
              return riwayatPesanan.isEmpty
                  ? Center(child: Text('Belum ada riwayat pesanan.'))
                  : ListView.builder(
                      itemCount: riwayatPesanan.length,
                      itemBuilder: (context, index) {
                        Map<String, String> pesanan = riwayatPesanan[index];
                        double harga = double.parse(pesanan['harga'] ?? '0');
                        int jumlahKursi =
                            int.parse(pesanan['jumlahKursi'] ?? '0');
                        double totalPembayaran = harga * jumlahKursi;
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
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
                          margin: EdgeInsets.all(10.0),
                          child: Stack(
                            children: [
                              ListTile(
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nama Lengkap',
                                              style: TextStyle(fontSize: 13),
                                            ),
                                            Text('${pesanan['namaLengkap']}',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500)),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Nomor Telepon',
                                              style: TextStyle(fontSize: 13),
                                            ),
                                            Text('${pesanan['nomorTelepon']}',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500)),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Tanggal Berangkat',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400)),
                                            Text('${pesanan['tanggalPesanan']}',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500)),
                                            SizedBox(
                                              height: 43,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Waktu Berangkat',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.5),
                                            ),
                                            Text(
                                              '${pesanan['jamBerangkat']}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13),
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
                                              '${pesanan['jamSampai']}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 45,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Jumlah Kursi Pesanan',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13),
                                              ),
                                              Text(
                                                '${pesanan['jumlahKursi']} Kursi',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13),
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Text(
                                                'Harga Per tiket',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13),
                                              ),
                                              Text(
                                                'Rp ${pesanan['harga']}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13),
                                              ),
                                              // SizedBox(
                                              //   height: 16,
                                              // )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Rute',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '${pesanan['kotaAwal']} - ${pesanan['kotaTujuan']}',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Total Pembayaran',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.amber),
                                        ),
                                        SizedBox(
                                          width: 53,
                                        ),
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
                              ),
                              Positioned(
                                top: 8.0,
                                right: 8.0,
                                child: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    hapusPesanan(index);
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
            }
          },
        ),
      ),
    );
  }

  // Fungsi untuk menghapus pesanan berdasarkan index
  void hapusPesanan(int index) async {
    await PesananStorage.hapusPesanan(index);

    // Refresh tampilan setelah menghapus pesanan
    _loadRiwayatPesanan();
  }
}
