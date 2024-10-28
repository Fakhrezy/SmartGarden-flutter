import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart';  
import 'pages/loading_page.dart';  

void main() {
  runApp(const SmartGardenApp());
}

class SmartGardenApp extends StatelessWidget {
  const SmartGardenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Garden',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoadingScreen(),  // Set LoadingScreen sebagai halaman utama
      debugShowCheckedModeBanner: false,  // Hilangkan label debug
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToDashboard();
  }

  _navigateToDashboard() async {
    await Future.delayed(const Duration(seconds: 3), () {});  // Simulasi waktu loading
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const DashboardPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const LoadingPage();  // Tampilkan halaman loading
  }
}
