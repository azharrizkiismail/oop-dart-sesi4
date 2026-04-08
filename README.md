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
<img width="1872" height="941" alt="1" src="https://github.com/user-attachments/assets/51f5bcd2-ab9e-42f1-83f6-a51d378cd464" />


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
<img width="1873" height="943" alt="2" src="https://github.com/user-attachments/assets/d5d2631b-33c6-485a-8207-c9a31d9382a9" />


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
<img width="1871" height="941" alt="3" src="https://github.com/user-attachments/assets/ad598318-4353-4cea-8a20-34f4bd076269" />


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
<img width="1875" height="942" alt="4" src="https://github.com/user-attachments/assets/943a6856-ac7f-40ad-96b4-c753eacb6c27" />


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
<img width="1875" height="941" alt="5" src="https://github.com/user-attachments/assets/5b0e49cb-61c3-4235-a4ad-fda9b7a76ca4" />


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
<img width="1874" height="940" alt="6" src="https://github.com/user-attachments/assets/e90aefcf-c084-4815-9b49-babfd92668fa" />


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
<img width="1871" height="937" alt="7" src="https://github.com/user-attachments/assets/b06490ce-1228-424b-b7fd-d8bd032a2242" />


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
<img width="1869" height="939" alt="8" src="https://github.com/user-attachments/assets/61e82348-b638-43b3-9dd3-e7f1f26eaf09" />


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
<img width="1874" height="942" alt="9" src="https://github.com/user-attachments/assets/a410f84f-b486-49fd-a915-79e7d78757b9" />


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
<img width="1870" height="941" alt="10" src="https://github.com/user-attachments/assets/1d9e2288-0258-4830-934a-4f5129ad2da1" />


---

# Latihan

## Latihan 1-3

```dart
// 1. Abstract class Pekerja
abstract class Pekerja {
  void bekerja();
}

// 2. Implementasi class
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

// 3. Demonstrasi Polimorfisme
void main() {
  List<Pekerja> daftarPekerja = [
    Programmer(),
    Dokter(),
    Guru(),
  ];

  print('=== Demonstrasi Polimorfisme Pekerja ===');

  for (var pekerja in daftarPekerja) {
    pekerja.bekerja();
  }
}
```
<img width="1875" height="940" alt="11" src="https://github.com/user-attachments/assets/751c19bd-9824-402d-a70d-d0c4d546cc69" />


---

## Latihan 4

```dart
// Class dasar
class Komputer {
  void komputasi() => print('Melakukan komputasi');
}

class Kamera {
  void foto() => print('Mengambil foto');
}

class Telepon {
  void telepon() => print('Melakukan panggilan');
}

// Tablet mewarisi Komputer dan memiliki Kamera & Telepon
class Tablet extends Komputer {
  Kamera kamera = Kamera();
  Telepon teleponFitur = Telepon();

  void gunakanSemuaFitur() {
    komputasi();
    kamera.foto();
    teleponFitur.telepon();
  }
}

// MAIN
void main() {
  Tablet tablet = Tablet();

  print('=== Fitur Tablet ===');
  tablet.gunakanSemuaFitur();
}
```
<img width="1872" height="942" alt="12" src="https://github.com/user-attachments/assets/a681f396-6091-44b3-ab3e-e20250cb61b2" />


---

## Latihan 5

```dart
import 'dart:math';

class MathUtils {
  // Factorial
  static int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }

  // Cek bilangan prima
  static bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i <= sqrt(n); i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  // Pembulatan desimal
  static double roundTo(double value, int decimal) {
    double mod = pow(10, decimal).toDouble();
    return (value * mod).round() / mod;
  }

  // Random integer
  static int randomInt(int min, int max) {
    return min + Random().nextInt(max - min + 1);
  }

  // Random double
  static double randomDouble(double min, double max) {
    return min + Random().nextDouble() * (max - min);
  }

  // Rata-rata
  static double average(List<num> list) {
    return list.reduce((a, b) => a + b) / list.length;
  }

  // Median
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

// MAIN
void main() {
  print('=== MathUtils Demo ===');

  print('Factorial 5: ${MathUtils.factorial(5)}');
  print('Is 7 prime? ${MathUtils.isPrime(7)}');
  print('Round 3.14159 -> 2 decimal: ${MathUtils.roundTo(3.14159, 2)}');

  print('Random Int (1-10): ${MathUtils.randomInt(1, 10)}');
  print('Random Double (1-5): ${MathUtils.randomDouble(1, 5)}');

  List<num> data = [1, 2, 3, 4, 5];
  print('Average: ${MathUtils.average(data)}');
  print('Median: ${MathUtils.median(data)}');
}
```
<img width="1872" height="940" alt="13" src="https://github.com/user-attachments/assets/e34bb78f-561d-4997-806c-a02573a10ed1" />


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
<img width="1872" height="943" alt="14" src="https://github.com/user-attachments/assets/88857bc6-ed76-47a9-9463-a83daceeb4c3" />

