import 'package:flutter/material.dart';
import 'graph/grafik_suhu_page.dart';
import 'graph/grafik_kelembaban_page.dart';
import 'graph/grafik_cahaya_page.dart';
import 'graph/grafik_cuaca_page.dart';
import 'graph/grafik_hama_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isWateringOn = false;
  bool isLampOn = false;
  bool isRoofOpen = false;
  bool isAutomaticWateringOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Smart Garden'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  buildInfoCard(
                    Icons.thermostat, 
                    'Suhu', 
                    '25.0°C', 
                    () => Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const GrafikSuhuPage())
                    ),
                  ),
                  buildInfoCard(
                    Icons.grass, 
                    'Kelembaban Tanah', 
                    '45.0%', 
                    () => Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const GrafikKelembabanPage())
                    ),
                  ),
                  buildInfoCard(
                    Icons.wb_sunny, 
                    'Cahaya', 
                    '25.0%', 
                    () => Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const GrafikCahayaPage())
                    ),
                  ),
                  buildInfoCard(
                    Icons.cloud, 
                    'Cuaca', 
                    'Cerah', 
                    () => Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const GrafikCuacaPage())
                    ),
                  ),
                  buildInfoCard(
                    Icons.pest_control, 
                    'Hama', 
                    'Tidak terdeteksi', 
                    () => Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const GrafikHamaPage())
                    ),
                  ),
                  buildSwitchCard(Icons.opacity, 'Penyiraman Otomatis', isAutomaticWateringOn, (value) {
                    setState(() {
                      isAutomaticWateringOn = value;
                    });
                  }),
                ],
              ),
            ),
            buildSwitchControl(Icons.water_drop, 'Siram Tanaman', isWateringOn, (value) {
              setState(() {
                isWateringOn = value;
              });
            }),
            buildSwitchControl(Icons.lightbulb, 'Nyalakan Lampu', isLampOn, (value) {
              setState(() {
                isLampOn = value;
              });
            }),
            buildSwitchControl(Icons.roofing, 'Buka Atap', isRoofOpen, (value) {
              setState(() {
                isRoofOpen = value;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard(IconData icon, String title, String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.grey[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40.0),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(value, style: const TextStyle(fontSize: 16.0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSwitchCard(IconData icon, String title, bool value, Function(bool) onChanged) {
    return Card(
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40.0),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.green, // Warna saat aktif
              inactiveThumbColor: Colors.grey, // Warna thumb saat tidak aktif
              inactiveTrackColor: Colors.grey[300], // Warna track saat tidak aktif
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwitchControl(IconData icon, String title, bool value, Function(bool) onChanged) {
    return Card(
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.green, // Warna saat aktif
          inactiveThumbColor: Colors.grey, // Warna thumb saat tidak aktif
          inactiveTrackColor: Colors.grey[300], // Warna track saat tidak aktif
        ),
      ),
    );
  }
}
