import 'package:flutter/material.dart';

class GrafikCuacaPage extends StatelessWidget {
  const GrafikCuacaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grafik Cuaca'),
      ),
      body: const Center(
        child: Text('Tampilan Grafik Cuaca'),
      ),
    );
  }
}
