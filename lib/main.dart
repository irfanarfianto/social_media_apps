import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(), // Menampilkan SplashScreen terlebih dahulu
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false; // Inisialisasi status login

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    // Di sini Anda dapat menambahkan logika untuk memeriksa status login, seperti dari Shared Preferences, Firebase Auth, dll.
    // Contoh sederhana untuk simulasi status login:
    await Future.delayed(
        const Duration(seconds: 2)); // Delay untuk simulasi splash screen

    // Ganti logika ini dengan pengecekan status login yang sesuai pada aplikasi Anda
    isLoggedIn = true; // Misalnya, setelah delay, pengguna dianggap sudah login

    // Setelah pengecekan status login, arahkan navigasi sesuai dengan hasil pengecekan
    if (isLoggedIn) {
      // Jika sudah login, navigasikan ke halaman HomeScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const HomeScreen(title: 'Home Page')),
      );
    } else {
      // Jika belum login, navigasikan ke halaman LoginScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Ganti dengan warna latar belakang yang diinginkan
      body: Center(
        child: FlutterLogo(
            size: 200), // Ganti dengan logo atau animasi yang diinginkan
      ),
    );
  }
}
