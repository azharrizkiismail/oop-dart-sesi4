# Resume Materi Sesi 4
## Polimorfisme dan Abstraksi dalam Pemrograman Berorientasi Objek (Dart)

**Nama :** Azhar Rizki Ismail 
**NIM :** 23141005P
**Kelas :** SI6KR
**Mata Kuliah :** Pemrograman Berorientasi Objek  

---

# Pendahuluan

Pemrograman Berorientasi Objek (Object-Oriented Programming/OOP) merupakan paradigma pemrograman yang berfokus pada penggunaan objek dan kelas dalam membangun suatu sistem. Pendekatan ini memungkinkan pengembang untuk memodelkan permasalahan dunia nyata ke dalam bentuk program yang lebih terstruktur, modular, dan mudah dikembangkan. Dalam OOP, terdapat beberapa konsep utama seperti inheritance, encapsulation, polymorphism, dan abstraction yang saling mendukung dalam meningkatkan kualitas perangkat lunak.

Pada sesi ini, pembahasan difokuskan pada konsep polimorfisme dan abstraksi. Polimorfisme memungkinkan suatu objek memiliki banyak bentuk perilaku tergantung pada konteks penggunaannya, sedangkan abstraksi berperan dalam menyederhanakan kompleksitas dengan menyembunyikan detail implementasi dan hanya menampilkan fungsionalitas utama kepada pengguna. Kedua konsep ini sangat penting dalam menciptakan kode yang fleksibel dan efisien.

Dengan memahami dan menerapkan polimorfisme serta abstraksi, seorang programmer dapat mengembangkan program yang lebih mudah dipelihara, dikembangkan, dan digunakan kembali. Selain itu, kedua konsep ini juga membantu dalam membangun sistem yang scalable dan adaptif terhadap perubahan kebutuhan, sehingga sangat relevan dalam pengembangan perangkat lunak modern.

---

# Polimorfisme

## Pengertian Polimorfisme

Polimorfisme adalah konsep dalam pemrograman berorientasi objek yang memungkinkan suatu objek memiliki banyak bentuk atau perilaku tergantung pada konteks penggunaannya, biasanya melalui mekanisme pewarisan dan method overriding. Dengan polimorfisme, objek dari subclass dapat diperlakukan sebagai objek dari superclass, sehingga satu interface dapat digunakan untuk berbagai implementasi yang berbeda.

Manfaat Polimorfisme :
- Meningkatkan fleksibilitas dalam pengembangan program
- Mempermudah penambahan fitur baru tanpa mengubah kode yang sudah ada (extensibility)
- Mendukung penggunaan kembali kode (reusability)
- Mempermudah proses pemeliharaan dan pengelolaan sistem (maintainability)

#### Contoh :

```dart
class Hewan {
  void bersuara() => print('...');
}

class Kucing extends Hewan {
  @override
  void bersuara() => print('Meong');
}

void main() {
  Hewan h = Kucing();
  h.bersuara(); // Output: Meong
}
```

## Polimorfisme dengan Inheritance

Polimorfisme dengan inheritance terjadi ketika objek dari class turunan digunakan melalui referensi class induk. Method yang dipanggil akan mengikuti implementasi dari objek aslinya, sehingga memungkinkan perilaku yang berbeda dalam satu tipe referensi yang sama.

#### Contoh :

```dart
class Bentuk {
  void gambar() => print('Menggambar bentuk');
}

class Lingkaran extends Bentuk {
  @override
  void gambar() => print('Menggambar lingkaran');
}

class Persegi extends Bentuk {
  @override
  void gambar() => print('Menggambar persegi');
}

void main() {
  Bentuk bentuk1 = Lingkaran();
  Bentuk bentuk2 = Persegi();

  bentuk1.gambar();
  bentuk2.gambar();
}
```

## Operator is dan as

Operator is digunakan untuk mengecek tipe suatu objek, sedangkan operator as digunakan untuk melakukan casting tipe objek. Operator is biasanya digunakan sebelum as untuk memastikan keamanan saat melakukan casting. Dengan demikian, kesalahan saat mengakses method atau properti yang tidak sesuai tipe dapat dihindari.

#### Contoh :

```dart
class Kendaraan {}

class Mobil extends Kendaraan {
  void klakson() => print('Tin!');
}

void main() {
  Kendaraan k = Mobil();

  if (k is Mobil) {
    (k as Mobil).klakson();
  }

  // Safe casting
  (k as Mobil?)?.klakson();
}
```

---

# Abstract

Abstraksi adalah konsep dalam pemrograman berorientasi objek yang digunakan untuk menyederhanakan kompleksitas dengan cara menyembunyikan detail implementasi dan hanya menampilkan fungsionalitas utama dari suatu objek. Dengan abstraksi, programmer dapat lebih fokus pada apa yang dilakukan oleh suatu sistem tanpa harus memahami bagaimana proses tersebut dijalankan secara internal. Dalam praktiknya, abstraksi membantu meningkatkan keteraturan kode, memudahkan pengembangan, serta memungkinkan adanya fleksibilitas dalam implementasi melalui penggunaan abstract class dan interface.

## Abstract Class

Abstract class adalah kelas yang tidak dapat diinstansiasi secara langsung dan digunakan sebagai dasar atau blueprint bagi class turunan. Kelas ini dapat berisi method abstract (tanpa implementasi) maupun method concrete (dengan implementasi). Setiap class turunan wajib mengimplementasikan method abstract yang telah ditentukan sesuai dengan kebutuhan masing-masing.

#### Contoh :

```dart
abstract class Kendaraan {
  String? merk;

  void start(); // abstract method

  void stop() {
    print('Kendaraan berhenti');
  }
}

class Mobil extends Kendaraan {
  @override
  void start() {
    print('Mobil $merk menyala');
  }
}

void main() {
  Mobil m = Mobil();
  m.merk = "Toyota";

  m.start();
  m.stop();
}
```

## Abstract Method

Abstract method adalah method yang tidak memiliki implementasi atau isi di dalam class induk (abstract class). Method ini hanya dideklarasikan tanpa body dan wajib diimplementasikan oleh class turunan. Tujuannya adalah untuk menentukan kontrak agar setiap subclass memiliki struktur method yang sama.

#### Contoh :

```dart
abstract class AlatMusik {
  void mainkan(); // abstract method
}

class Gitar extends AlatMusik {
  @override
  void mainkan() {
    print('Jreng jreng...');
  }
}

void main() {
  Gitar gitar = Gitar();
  gitar.mainkan();
}
```

## Interface

Interface adalah kontrak yang harus diimplementasikan oleh class lain menggunakan keyword implements. Setiap class yang mengimplementasikan interface wajib mengoverride semua method yang ada di dalamnya.

#### Contoh :

```dart
class Flyable {
  void terbang() {}
}

class Burung implements Flyable {
  @override
  void terbang() {
    print('Burung terbang');
  }
}

class Pesawat implements Flyable {
  @override
  void terbang() {
    print('Pesawat terbang');
  }
}

void main() {
  Burung b = Burung();
  Pesawat p = Pesawat();

  b.terbang();
  p.terbang();
}
```

## Static Members and Method

Static members dan method adalah bagian dari class yang dapat diakses tanpa harus membuat objek dari class tersebut. Biasanya digunakan untuk fungsi utilitas atau nilai yang bersifat umum sehingga dapat dipanggil langsung melalui nama class.

#### Contoh :

```dart
class MathUtils {
  static double pi = 3.14;

  static int add(int x, int y) {
    return x + y;
  }
}

void main() {
  print('Nilai pi: ${MathUtils.pi}');
  print('Hasil penjumlahan: ${MathUtils.add(10, 20)}');
}
```

---

# Kesimpulan

Polimorfisme dan abstraksi merupakan dua konsep penting dalam pemrograman berorientasi objek yang berperan dalam meningkatkan kualitas dan fleksibilitas suatu program. Polimorfisme memungkinkan penggunaan satu tipe referensi untuk berbagai objek dengan perilaku yang berbeda, sedangkan abstraksi membantu menyederhanakan kompleksitas dengan menyembunyikan detail implementasi. Kedua konsep ini saling melengkapi dalam membangun sistem yang lebih terstruktur dan efisien.

Penerapan polimorfisme dapat dilihat melalui penggunaan inheritance, interface, serta struktur data seperti list yang mampu menampung berbagai objek dengan tipe yang sama. Sementara itu, abstraksi diterapkan melalui abstract class dan interface yang berfungsi sebagai blueprint atau kontrak bagi class turunan. Dengan adanya konsep ini, pengembangan program menjadi lebih fleksibel dan mudah untuk dikembangkan lebih lanjut tanpa harus mengubah struktur utama.

Secara keseluruhan, pemahaman terhadap polimorfisme dan abstraksi sangat penting bagi seorang programmer dalam merancang sistem yang scalable, reusable, dan maintainable. Dengan menerapkan kedua konsep ini secara tepat, program yang dihasilkan tidak hanya lebih rapi, tetapi juga lebih mudah dalam proses pengembangan dan pemeliharaan di masa depan.

---

# Praktik 1

## Polimorfisme dengan list

```dart
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

void main() {
  List<Hewan> daftarHewan = [
    Kucing(),
    Anjing(),
    Burung(),
  ];

  for (var hewan in daftarHewan) {
    hewan.bersuara();
  }
}
```

---

# Praktik 2

## Sistem Pembayaran

```dart
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

void main() {
  List<MetodePembayaran> metode = [
    KartuKredit(),
    EWallet(),
    Tunai(),
  ];

  for (var m in metode) {
    m.bayar(100000);
  }
}
```

---

# Studi Kasus

## Sistem Bentuk Geometri

```dart
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
        'Persegi dengan sisi $sisi memiliki luas ${hitungLuas()} dan keliling ${hitungKeliling()}');
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
        'Lingkaran dengan radius $radius memiliki luas ${hitungLuas()} dan keliling ${hitungKeliling()}');
  }
}

void main() {
  Persegi p = Persegi(4);
  Lingkaran l = Lingkaran(7);

  p.info();
  l.info();
}
```

---

# Latihan

## Latihan 1

```dart
abstract class Pekerja {
  void bekerja();
}

class Programmer implements Pekerja {
  @override
  void bekerja() {
    print('Programmer sedang coding');
  }
}

class Dokter implements Pekerja {
  @override
  void bekerja() {
    print('Dokter sedang mengobati pasien');
  }
}

class Guru implements Pekerja {
  @override
  void bekerja() {
    print('Guru sedang mengajar');
  }
}
```

---

## Latihan 2

```dart
class Programmer implements Pekerja {
  @override
  void bekerja() {
    print('Programmer sedang coding');
  }
}

class Dokter implements Pekerja {
  @override
  void bekerja() {
    print('Dokter sedang mengobati pasien');
  }
}

class Guru implements Pekerja {
  @override
  void bekerja() {
    print('Guru sedang mengajar');
  }
}
```

---

## Latihan 3

```dart
void main() {
  List<Pekerja> daftarPekerja = [
    Programmer(),
    Dokter(),
    Guru(),
  ];

  for (var pekerja in daftarPekerja) {
    pekerja.bekerja();
  }
}
```

---

## Latihan 4

```dart
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
```

---

## Latihan 5

```dart
import 'dart:math';

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
```

---

## Challenge

```dart
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
  void play() {
    print('Audio diputar');
  }

  @override
  void pause() {
    print('Audio dijeda');
  }
}

class VideoPlayer implements MediaPlayer, Playable, Pausable {
  @override
  void play() {
    print('Video diputar');
  }

  @override
  void pause() {
    print('Video dijeda');
  }
}

void main() {
  AudioPlayer audio = AudioPlayer();
  VideoPlayer video = VideoPlayer();

  audio.play();
  audio.pause();

  video.play();
  video.pause();
}
```
