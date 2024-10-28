import 'package:flutter/material.dart';

class GrafikSuhuPage extends StatelessWidget {
  const GrafikSuhuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grafik Suhu'),
      ),
      body: const Center(
        child: Text('Tampilan Grafik Suhu'),
      ),
    );
  }
}
