import 'package:flutter/material.dart';
import 'dart:async'; // Digunakan untuk Timer

class MyClockWidget extends StatefulWidget {
  const MyClockWidget({Key? key}) : super(key: key);

  @override
  _MyClockWidgetState createState() => _MyClockWidgetState();
}

class _MyClockWidgetState extends State<MyClockWidget> {
  // Variabel untuk menyimpan waktu saat ini
  String _currentTime = "";

  @override
  void initState() {
    super.initState();
    _currentTime = _formatTime(DateTime.now());
    // Memperbarui jam setiap detik
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = _formatTime(DateTime.now()); // Mengupdate waktu setiap detik
      });
    });
  }

  // Fungsi untuk memformat waktu ke dalam bentuk HH:mm:ss
  String _formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:"
           "${time.minute.toString().padLeft(2, '0')}:"
           "${time.second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _currentTime, // Menampilkan waktu saat ini
        style: const TextStyle(
          fontSize: 48, // Ukuran teks jam
          fontWeight: FontWeight.bold, // Teks tebal
        ),
      ),
    );
  }
}
