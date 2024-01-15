import 'package:shared_preferences/shared_preferences.dart';

class PesananStorage {
  static const String _keyNamaLengkap = 'namaLengkap';
  static const String _keyNomorTelepon = 'nomorTelepon';
  static const String _keyTanggalPesanan = 'tanggalPesanan';
  static const String _keyJamBerangkat = 'jamBerangkat';
  static const String _keyJamSampai = 'jamSampai';
  static const String _keyJumlahKursi = 'jumlahKursi';
  static const String _keyHarga = 'harga';
  static const String _keyKotaAwal = 'kotaAwal';
  static const String _keyKotaTujuan = 'kotaTujuan';
  static const String _keyRiwayatPesanan = 'riwayatPesanan';

  static Future<void> simpanPesanan(
      {required String namaLengkap,
      required String nomorTelepon,
      required String tanggalPesanan,
      required String jamBerangkat,
      required String jamSampai,
      required String jumlahKursi,
      required String harga,
      required String kotaAwal,
      required String kotaTujuan}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyNamaLengkap, namaLengkap);
    prefs.setString(_keyNomorTelepon, nomorTelepon);
    prefs.setString(_keyTanggalPesanan, tanggalPesanan);
    prefs.setString(_keyJamBerangkat, jamBerangkat);
    prefs.setString(_keyJamSampai, jamSampai);
    prefs.setString(_keyJumlahKursi, jumlahKursi);
    prefs.setString(_keyHarga, harga);
    prefs.setString(_keyKotaAwal, kotaAwal);
    prefs.setString(_keyKotaTujuan, kotaTujuan);

    // Tambahkan pesanan ke riwayat
    List<Map<String, String>> riwayatPesanan = await getRiwayatPesanan();
    riwayatPesanan.add({
      _keyNamaLengkap: namaLengkap,
      _keyNomorTelepon: nomorTelepon,
      _keyJamBerangkat: jamBerangkat,
      _keyJamSampai: jamSampai,
      _keyTanggalPesanan: tanggalPesanan,
      _keyHarga: harga,
      _keyJumlahKursi: jumlahKursi,
      _keyKotaAwal: kotaAwal,
      _keyKotaTujuan: kotaTujuan,
    });
    prefs.setStringList(
        _keyRiwayatPesanan,
        riwayatPesanan
            .map((map) => map.entries.map((entry) => '${entry.key}:${entry.value}').join(','))
            .toList());
  }

  static Future<List<Map<String, String>>> getRiwayatPesanan() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? riwayatStringList = prefs.getStringList(_keyRiwayatPesanan);
    if (riwayatStringList == null) {
      return [];
    }
    return riwayatStringList
        .map((e) => Map<String, String>.fromIterable(e.split(','),
            key: (v) => v.split(':')[0], value: (v) => v.split(':')[1]))
        .toList();
  }

  static Future<Map<String, String>> getPesanan() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      _keyNamaLengkap: prefs.getString(_keyNamaLengkap) ?? '',
      _keyNomorTelepon: prefs.getString(_keyNomorTelepon) ?? '',
      _keyJamBerangkat: prefs.getString(_keyJamBerangkat) ?? '',
      _keyJamSampai: prefs.getString(_keyJamSampai) ?? '',
      _keyJumlahKursi: prefs.getString(_keyJumlahKursi) ?? '',
      _keyTanggalPesanan: prefs.getString(_keyTanggalPesanan) ?? '',
      _keyHarga: prefs.getString(_keyHarga) ?? '',
      _keyKotaAwal: prefs.getString(_keyKotaAwal) ?? '',
      _keyKotaTujuan: prefs.getString(_keyKotaTujuan) ?? '',

    };
  }

  static Future<void> hapusPesanan(int index) async {
    try {
      // ... operasi asynchronous
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<Map<String, String>> riwayatPesanan = await getRiwayatPesanan();

      // Hapus pesanan dengan index tertentu
      riwayatPesanan.removeAt(index);

      prefs.setStringList(
        _keyRiwayatPesanan,
        riwayatPesanan
            .map((map) => map.entries.map((entry) => '${entry.key}:${entry.value}').join(','))
            .toList());
    } catch (error) {
      print('Error: $error');
      // Handle error di sini sesuai kebutuhan aplikasi Anda
    }
  }

  static Future<void> clearPesanan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('namaLengkap');
    await prefs.remove('nomorTelepon');
    await prefs.remove('tanggalPesanan');
    await prefs.remove('jamBerangkat');
    await prefs.remove('jamSampai');
    await prefs.remove('jumlahKursi');
    await prefs.remove('harga');
    await prefs.remove('kotaAwal');
    await prefs.remove('kotaTujuan');
    await prefs.remove('riwayatPesanan');
  }

}
