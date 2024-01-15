class Pool2 {
  String jenis;
  String kotaAwal;
  String KotaTujuan;
  String harga;
  String kursi;
  var jamBrngkt;
  var jamSampai;
  var selisihJam;

  Pool2({
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

List<Pool2> BandungJakartaData = [
  Pool2(
    jenis: "Eksekutif",
    kotaAwal: "Bandung",
    KotaTujuan: "Jakarta",
    harga: "210.000",
    kursi: '5 seats',
    jamBrngkt: "07.00",
    jamSampai: "11.00",
    selisihJam: "4h 0m"
  ),
  Pool2(
    jenis: "Eksekutif",
    kotaAwal: "SCBD",
    KotaTujuan: "Dipati Ukur",
    harga: "180.000",
    kursi: '7 seats',
    jamBrngkt: "09.15",
    jamSampai: "12.00",
    selisihJam: "3h 12m"
  ),
  Pool2(
    jenis: "Eksekutif",
    kotaAwal: "Dipati Ukur",
    KotaTujuan: "Kelapa Gading",
    harga: "150.000",
    kursi: '4 seats',
    jamBrngkt: "19.00",
    jamSampai: "01.00",
    selisihJam: "7h 0m"
  ),
  Pool2(
    jenis: "Eksekutif",
    kotaAwal: "Fatmawati",
    KotaTujuan: "Dipati Ukur",
    harga: "180.000",
    kursi: '7 seats',
    jamBrngkt: "07.00",
    jamSampai: "11.00",
    selisihJam: "4h 0m"
  ),
  Pool2(
    jenis: "Eksekutif",
    kotaAwal: "Dipati Ukur",
    KotaTujuan: "Pandanaran",
    harga: "180.000",
    kursi: '7 seats',
    jamBrngkt: "07.00",
    jamSampai: "11.00",
    selisihJam: "4h 0m"
  ),
  Pool2(
    jenis: "Eksekutif",
    kotaAwal: "Pasteur",
    KotaTujuan: "Central Park",
    harga: "180.000",
    kursi: '7 seats',
    jamBrngkt: "07.00",
    jamSampai: "11.00",
    selisihJam: "4h 0m"
  ),
  Pool2(
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