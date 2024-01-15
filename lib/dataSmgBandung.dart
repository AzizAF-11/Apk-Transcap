class Pool {
  String jenis;
  String kotaAwal;
  String KotaTujuan;
  String harga;
  String kursi;
  var jamBrngkt;
  var jamSampai;
  var selisihJam;

  Pool({
    required this.jenis,
    required this.kotaAwal,
    required this.KotaTujuan,
    required this.harga,
    required this.kursi,
    required this.jamBrngkt,
    required this.jamSampai,
    required this.selisihJam,
  });
}

List<Pool> semarangBandungData = [
  Pool(
    jenis: "Eksekutif",
    kotaAwal: "Semarang",
    KotaTujuan: "Bandung",
    harga: "210.000",
    kursi: '5 seats',
    jamBrngkt: "07.00",
    jamSampai: "11.00",
    selisihJam: "4h 0m"
  ),
  Pool(
    jenis: "Eksekutif",
    kotaAwal: "Dipati Ukur",
    KotaTujuan: "Pandanaran",
    harga: "180.000",
    kursi: '7 seats',
    jamBrngkt: "09.15",
    jamSampai: "12.00",
    selisihJam: "3h 12m"
  ),
  Pool(
    jenis: "Eksekutif",
    kotaAwal: "Dipati Ukur",
    KotaTujuan: "Tembalang",
    harga: "170.000",
    kursi: '4 seats',
    jamBrngkt: "19.00",
    jamSampai: "01.00",
    selisihJam: "7h 0m"
  ),
  Pool(
    jenis: "Eksekutif",
    kotaAwal: "Semarang",
    KotaTujuan: "Dipati Ukur",
    harga: "180.000",
    kursi: '7 seats',
    jamBrngkt: "07.00",
    jamSampai: "11.00",
    selisihJam: "4h 0m"
  ),
  Pool(
    jenis: "Eksekutif",
    kotaAwal: "Dipati Ukur",
    KotaTujuan: "Pandanaran",
    harga: "180.000",
    kursi: '7 seats',
    jamBrngkt: "07.00",
    jamSampai: "11.00",
    selisihJam: "4h 0m"
  ),
  Pool(
    jenis: "Eksekutif",
    kotaAwal: "Dipati Ukur",
    KotaTujuan: "Pandanaran",
    harga: "180.000",
    kursi: '7 seats',
    jamBrngkt: "07.00",
    jamSampai: "11.00",
    selisihJam: "4h 0m"
  ),
  Pool(
    jenis: "Eksekutif",
    kotaAwal: "Dipati Ukur",
    KotaTujuan: "Pandanaran",
    harga: "180.000",
    kursi: '7 seats',
    jamBrngkt: "07.00",
    jamSampai: "11.00",
    selisihJam: "4h 0m"
  ),
  // Add more items as needed...
];