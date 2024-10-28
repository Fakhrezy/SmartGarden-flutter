import 'package:flutter/material.dart';
import 'register_page.dart';  // Import halaman register
import 'dashboard_page.dart'; // Import halaman dashboard setelah login

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: SingleChildScrollView( // Tambahkan SingleChildScrollView di sini
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Selamat Datang!',
                  style: TextStyle(
                    fontSize: 20.0, // Ukuran font
                    fontWeight: FontWeight.bold, // Gaya font tebal
                  ),
                  textAlign: TextAlign.center, // Rata tengah
                ),
                const Text(
                  'di Smart Garden App',
                  style: TextStyle(
                    fontSize: 15.0, // Ukuran font
                  ),
                  textAlign: TextAlign.center, // Rata tengah
                ),
                const SizedBox(height: 10.0),
                // widget Image di sini
                Image.asset(
                  'assets/garden.png', // path gambar
                  height: 70.0, // tinggi gambar
                ),
                const SizedBox(height: 20.0), // jarak antara gambar dan form
                // Container untuk background abu-abu
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      // TextField untuk Email
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // TextField untuk Password
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      // Tombol Login
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 12.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          // Lakukan validasi atau login
                          if (email.isNotEmpty && password.isNotEmpty) {
                            // Jika berhasil, navigasi ke DashboardPage
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const DashboardPage()),
                            );
                          } else {
                            // Tampilkan pesan error jika form tidak lengkap
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Silakan masukkan email dan password!')),
                            );
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                // Teks untuk ke Register Page
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text(
                    'Belum punya akun? Daftar disini',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
