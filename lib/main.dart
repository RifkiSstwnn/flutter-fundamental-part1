import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// Kelas MyApp adalah root aplikasi, menampilkan halaman utama (MyHomePage).
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contoh Date Picker', // Title aplikasi.
      home: MyHomePage(title: 'Contoh Date Picker'), // Halaman utama aplikasi.
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title; // Variabel untuk menyimpan judul halaman.

  @override
  _MyHomePageState createState() => _MyHomePageState(); // Membuat state.
}

class _MyHomePageState extends State<MyHomePage> {
  // State untuk menyimpan tanggal yang dipilih, default-nya adalah tanggal sekarang.
  DateTime selectedDate = DateTime.now();

  // Fungsi untuk menampilkan Date Picker dan mengambil tanggal yang dipilih oleh user.
  Future<void> _selectDate(BuildContext context) async {
    // showDatePicker adalah widget Flutter untuk memilih tanggal.
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Tanggal awal yang ditampilkan adalah tanggal yang tersimpan di selectedDate.
      firstDate: DateTime(2015, 8), // Tanggal terawal yang bisa dipilih.
      lastDate: DateTime(2101),     // Tanggal terakhir yang bisa dipilih.
    );

    // Jika user memilih tanggal dan tanggalnya berbeda dengan selectedDate saat ini, maka diperbarui.
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked; // Mengubah state menjadi tanggal yang dipilih.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Menampilkan judul pada AppBar.
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Mengatur ukuran kolom sesuai isi.
          children: <Widget>[
            // Menampilkan tanggal yang dipilih dalam format lokal (YYYY-MM-DD).
            Text("${selectedDate.toLocal()}".split(' ')[0]),

            const SizedBox(
              height: 20.0, // Menambahkan ruang antara teks dan tombol.
            ),
            // ElevatedButton yang saat ditekan akan memanggil DatePicker dan mencetak tanggal yang dipilih.
            ElevatedButton(
              onPressed: () => {
                _selectDate(context), // Memanggil fungsi _selectDate untuk memilih tanggal.
                // ignore: avoid_print
                print(selectedDate.day + selectedDate.month + selectedDate.year) // Mencetak tanggal ke konsol.
              },
              child: const Text('Pilih Tanggal'), // Teks tombol.
            ),
          ],
        ),
      ),
    );
  }
}






// Praktikum 5 Latihan 3
// void main() {
//   runApp(const MyApp()); // Menjalankan aplikasi dengan widget MyApp sebagai root.
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // MyApp adalah widget utama dari aplikasi.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo', // Nama aplikasi, biasanya hanya tampil di Android.
//       theme: ThemeData(
//         primarySwatch: Colors.red, // Warna utama tema aplikasi adalah merah.
//       ),
//       home: const MyHomePage(title: 'My Increment App'), // Halaman utama aplikasi.
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title; // Judul halaman yang di-passing melalui konstruktor.

//   @override
//   State<MyHomePage> createState() => _MyHomePageState(); // Menghubungkan dengan state-nya.
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0; // Variabel state untuk menyimpan jumlah hitungan tombol ditekan.

//   // Fungsi untuk menambah nilai counter.
//   void _incrementCounter() {
//     setState(() {
//       _counter++; // Menambah nilai counter setiap kali tombol ditekan.
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title), // Menampilkan judul halaman di AppBar.
//       ),
//       body: Center(
//         // Kolom yang diatur agar berada di tengah layar.
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center, // Mengatur posisi di tengah vertikal.
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:', // Teks statis yang menjelaskan aksi.
//             ),
//             Text(
//               '$_counter', // Menampilkan nilai counter yang akan berubah.
//               style: Theme.of(context).textTheme.headline4, // Menggunakan style teks headline.
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         // Bar di bagian bawah layar, di sini hanya ada container kosong setinggi 50px.
//         child: Container(
//           height: 50.0,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter, // Fungsi yang dijalankan saat tombol floating ditekan.
//         tooltip: 'Increment Counter', // Tooltip yang muncul saat tombol di-hover.
//         child: const Icon(Icons.add), // Ikon "+" di dalam tombol floating.
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Lokasi FAB di tengah bawah.
//     );
//   }
// }