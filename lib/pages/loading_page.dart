import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(), // Indikator loading
            const SizedBox(height: 20),
            Image.asset(
              'assets/garden.png', // Path gambar dari aset
              height: 100.0, // Sesuaikan tinggi gambar
            ),
            const SizedBox(height: 20),
            const Text(
              'Selamat Datang \n di Aplikasi Smart Garden!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}