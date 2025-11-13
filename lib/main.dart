import 'package:flutter/material.dart';
import 'dart:async';
import 'dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '152023152 - Martin Rizki Wendi Sinurat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E3A8A)),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          bodyMedium: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

// ==================== SPLASH SCREEN ====================
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;
  late Animation<double> _scaleUp;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _scaleUp = Tween<double>(begin: 0.8, end: 1.1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => const DashboardScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(scale: animation, child: child),
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E3A8A), Color(0xFF2563EB), Color(0xFF60A5FA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FadeTransition(
          opacity: _fadeIn,
          child: ScaleTransition(
            scale: _scaleUp,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.white, Color(0xFF93C5FD)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: const Icon(Icons.flutter_dash,
                        size: 100, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'UTS MOBILE',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Hero(
                    tag: 'profile',
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile.jpg',
                          fit: BoxFit.cover,
                          width: 130,
                          height: 130,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    '152023152',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Martin Rizki Wendi Sinurat',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 60),
                  const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
