class Iklan {
  final String? nama;
  final String? kategori;
  final String? sistem;
  final String? lokasi;
  final String? keinginan;
  final String? harga;
  final String? tanggalkadaluarsa;
  late final String? beratdibutuhkan;
  final String? beratmin;
  final String? beratmaks;

  Iklan(
      {this.nama,
      this.kategori,
      this.sistem,
      this.lokasi,
      this.keinginan,
      this.beratdibutuhkan,
      this.beratmaks,
      this.beratmin,
      this.harga,
      this.tanggalkadaluarsa});

  Iklan copyWith({
    String? nama,
    String? kategori,
    String? sistem,
    String? lokasi,
    String? keinginan,
    String? harga,
    String? tanggalkadaluarsa,
    String? beratdibutuhkan,
    String? beratmin,
    String? beratmaks,
  }) =>
      Iklan(
        nama: nama ?? this.nama,
        kategori: kategori ?? this.kategori,
        sistem: sistem ?? this.sistem,
        lokasi: keinginan ?? this.harga,
        tanggalkadaluarsa: beratdibutuhkan ?? this.beratdibutuhkan,
        harga: harga ?? this.harga,
        beratdibutuhkan: beratdibutuhkan ?? this.beratdibutuhkan,
        beratmin: beratmin ?? this.beratmin,
        beratmaks: beratmaks ?? this.beratmaks,
      );
}

List<Iklan> listIklan = [Iklan()];
