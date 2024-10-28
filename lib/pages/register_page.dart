import 'package:flutter/material.dart';
import 'login_page.dart';  // Import halaman login
import 'dashboard_page.dart'; // Import halaman dashboard setelah registrasi

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
                const SizedBox(height: 20.0),
                // widget Image di sini
                Image.asset(
                  'assets/garden.png', // path gambar
                  height: 70.0, // tinggi gambar
                ),
                const SizedBox(height: 20.0),
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
                        obscureText: _obscurePassword,
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
                              _obscurePassword ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // TextField untuk Konfirmasi Password
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: _obscureConfirmPassword,
                        decoration: InputDecoration(
                          labelText: 'Konfirmasi Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword = !_obscureConfirmPassword;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      // Tombol Register
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
                          String confirmPassword = _confirmPasswordController.text;

                          if (email.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty) {
                            if (password == confirmPassword) {
                              // Jika berhasil, navigasi ke DashboardPage
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const DashboardPage()),
                              );
                            } else {
                              // Tampilkan pesan error jika password tidak cocok
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Password dan konfirmasi password tidak cocok!')),
                              );
                            }
                          } else {
                            // Tampilkan pesan error jika form tidak lengkap
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Silakan lengkapi semua field!')),
                            );
                          }
                        },
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                // Teks untuk ke Login Page
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    'Sudah punya akun? Login disini',
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
