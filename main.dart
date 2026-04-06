import 'dart:math';

/// =====================
/// PRAKTIK 1 (HEWAN)
/// =====================
class Hewan {
  void bersuara() => print('...');
}

class Kucing extends Hewan {
  @override
  void bersuara() => print('Meong');
}

class Anjing extends Hewan {
  @override
  void bersuara() => print('Guk guk');
}

class Burung extends Hewan {
  @override
  void bersuara() => print('Cuit cuit');
}

/// =====================
/// PRAKTIK 2 (PEMBAYARAN)
/// =====================
abstract class MetodePembayaran {
  void bayar(double jumlah);
}

class KartuKredit implements MetodePembayaran {
  @override
  void bayar(double jumlah) {
    print('Bayar $jumlah dengan Kartu Kredit');
  }
}

class EWallet implements MetodePembayaran {
  @override
  void bayar(double jumlah) {
    print('Bayar $jumlah dengan E-Wallet');
  }
}

class Tunai implements MetodePembayaran {
  @override
  void bayar(double jumlah) {
    print('Bayar $jumlah dengan Tunai');
  }
}

/// =====================
/// STUDI KASUS (BENTUK)
/// =====================
abstract class Bentuk {
  double hitungLuas();
  double hitungKeliling();

  void info() {
    print('Luas: ${hitungLuas()}, Keliling: ${hitungKeliling()}');
  }
}

class Persegi implements Bentuk {
  double sisi;
  Persegi(this.sisi);

  @override
  double hitungLuas() => sisi * sisi;

  @override
  double hitungKeliling() => 4 * sisi;

  @override
  void info() {
    print(
        'Persegi sisi $sisi → luas ${hitungLuas()} & keliling ${hitungKeliling()}');
  }
}

class Lingkaran implements Bentuk {
  double radius;
  Lingkaran(this.radius);

  @override
  double hitungLuas() => 3.14 * radius * radius;

  @override
  double hitungKeliling() => 2 * 3.14 * radius;

  @override
  void info() {
    print(
        'Lingkaran radius $radius → luas ${hitungLuas()} & keliling ${hitungKeliling()}');
  }
}

/// =====================
/// LATIHAN (PEKERJA)
/// =====================
abstract class Pekerja {
  void bekerja();
}

class Programmer implements Pekerja {
  @override
  void bekerja() => print('Programmer sedang coding');
}

class Dokter implements Pekerja {
  @override
  void bekerja() => print('Dokter mengobati pasien');
}

class Guru implements Pekerja {
  @override
  void bekerja() => print('Guru mengajar');
}

/// =====================
/// LATIHAN 4 (TABLET)
/// =====================
class Komputer {
  void komputasi() => print('Melakukan komputasi');
}

class Kamera {
  void foto() => print('Mengambil foto');
}

class Telepon {
  void telepon() => print('Melakukan panggilan');
}

class Tablet extends Komputer {
  Kamera kamera = Kamera();
  Telepon teleponFitur = Telepon();
}

/// =====================
/// LATIHAN 5 (MATH UTILS)
/// =====================
class MathUtils {
  static int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }

  static bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i <= sqrt(n); i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  static double roundTo(double value, int decimal) {
    double mod = pow(10, decimal).toDouble();
    return (value * mod).round() / mod;
  }

  static int randomInt(int min, int max) {
    return min + Random().nextInt(max - min + 1);
  }

  static double randomDouble(double min, double max) {
    return min + Random().nextDouble() * (max - min);
  }

  static double average(List<num> list) {
    return list.reduce((a, b) => a + b) / list.length;
  }

  static double median(List<num> list) {
    var sorted = List<num>.from(list)..sort();
    int mid = sorted.length ~/ 2;

    if (sorted.length % 2 == 0) {
      return (sorted[mid - 1] + sorted[mid]) / 2;
    } else {
      return sorted[mid].toDouble();
    }
  }
}

/// =====================
/// CHALLENGE
/// =====================
abstract class MediaPlayer {
  void play();
}

abstract class Playable {
  void play();
}

abstract class Pausable {
  void pause();
}

class AudioPlayer implements MediaPlayer, Playable, Pausable {
  @override
  void play() => print('Audio diputar');

  @override
  void pause() => print('Audio dijeda');
}

class VideoPlayer implements MediaPlayer, Playable, Pausable {
  @override
  void play() => print('Video diputar');

  @override
  void pause() => print('Video dijeda');
}

/// =====================
/// MAIN (SEMUA DEMO)
/// =====================
void main() {
  print("=== PRAKTIK 1 ===");
  List<Hewan> hewan = [Kucing(), Anjing(), Burung()];
  for (var h in hewan) {
    h.bersuara();
  }

  print("\n=== PRAKTIK 2 ===");
  List<MetodePembayaran> metode = [
    KartuKredit(),
    EWallet(),
    Tunai()
  ];
  for (var m in metode) {
    m.bayar(100000);
  }

  print("\n=== STUDI KASUS ===");
  Persegi p = Persegi(4);
  Lingkaran l = Lingkaran(7);
  p.info();
  l.info();

  print("\n=== LATIHAN 3 ===");
  List<Pekerja> pekerja = [Programmer(), Dokter(), Guru()];
  for (var pk in pekerja) {
    pk.bekerja();
  }

  print("\n=== TABLET ===");
  Tablet t = Tablet();
  t.komputasi();
  t.kamera.foto();
  t.teleponFitur.telepon();

  print("\n=== MATH UTILS ===");
  print("Factorial 5: ${MathUtils.factorial(5)}");
  print("Is Prime 7: ${MathUtils.isPrime(7)}");
  print("Average: ${MathUtils.average([1,2,3,4])}");

  print("\n=== CHALLENGE ===");
  var audio = AudioPlayer();
  var video = VideoPlayer();
  audio.play();
  audio.pause();
  video.play();
  video.pause();
}
