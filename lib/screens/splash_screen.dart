import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    );

    _controller.forward();

    Timer(const Duration(milliseconds: 3800), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;

        // 1. Transisi Background
        double bgProgress = ((value - 0.65) / 0.2).clamp(0.0, 1.0);
        final navyColor = const Color(0xFF0F2042);
        final beigeColor = const Color(0xFFF7F5F0);
        final backgroundColor = Color.lerp(navyColor, beigeColor, bgProgress)!;

        // 2. Transisi Warna Elemen
        final lightBlue = const Color(0xFF8AB4F8);
        final brandBlue = const Color(0xFF4C7EBE);
        final elementColor = Color.lerp(lightBlue, brandBlue, bgProgress)!;

        // 3. Opacity Tagline
        double taglineOpacity = ((value - 0.85) / 0.15).clamp(0.0, 1.0);

        return Scaffold(
          backgroundColor: backgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- KANVAS LOGO DENGAN DETAKAN DARI KIRI KE KANAN ---
                SizedBox(
                  width: 200,
                  height: 140,
                  child: CustomPaint(
                    painter: LeftToRightClockBookPainter(
                      progress: value,
                      color: elementColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // --- MASKOT ---
                Image.asset(
                  'assets/images/mascot.png',
                  height: 110,
                ),
                const SizedBox(height: 16),

                // --- TEKS UTAMA ---
                Text(
                  'cendekiaid',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: elementColor,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 6),

                // --- TAGLINE ---
                Opacity(
                  opacity: taglineOpacity,
                  child: Text(
                    'Jelajah Ilmu, Kuasai Dunia',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: brandBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// --- ENGINE REVISI: GERAKAN DETAK KIRI KE KANAN ---
class LeftToRightClockBookPainter extends CustomPainter {
  final double progress;
  final Color color;

  LeftToRightClockBookPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height * 0.65);
    const double radius = 45.0;

    // Garis dasar horizontal buku
    canvas.drawLine(
      Offset(center.dx - radius, center.dy),
      Offset(center.dx + radius, center.dy),
      paint,
    );

    int totalSteps = 8; 
    double sweepProgress = (progress / 0.65).clamp(0.0, 1.0);

    // Mengubah progress menjadi step diskret (tek-tek)
    double tickedProgress = (sweepProgress * totalSteps).floor() / totalSteps;
    
    // NILAI BARU: Nilai sudut bergerak dari -pi (kiri) ditambah menuju 0 (kanan)
    double currentAngle = -math.pi + (math.pi * tickedProgress); 

    // Menggambar halaman membuka dari kiri ke kanan
    for (int i = 0; i <= totalSteps; i++) {
      double pageAngle = -math.pi + (i * math.pi / totalSteps);
      
      // Karena sudutnya membesar (dari negatif ke nol), gunakan kondisi '>='
      if (currentAngle >= pageAngle) {
        double x = center.dx + radius * math.cos(pageAngle);
        double y = center.dy + radius * math.sin(pageAngle);
        canvas.drawLine(center, Offset(x, y), paint);
      }
    }

    // Gambar jarum penunjuk aktif yang berdetak
    if (sweepProgress < 1.0) {
      final handPaint = Paint()
        ..color = color
        ..strokeWidth = 3.5
        ..strokeCap = StrokeCap.round;
      
      double handX = center.dx + radius * math.cos(currentAngle);
      double handY = center.dy + radius * math.sin(currentAngle);
      canvas.drawLine(center, Offset(handX, handY), handPaint);
    }

    // Pasak jam kecil di bawah
    if (progress > 0.5) {
      double ticksProgress = ((progress - 0.5) / 0.25).clamp(0.0, 1.0);
      List<double> tickAngles = [
        -math.pi * 1.15,
        -math.pi * 1.30,
        -math.pi * 1.50,
        -math.pi * 1.70,
        -math.pi * 1.85,
      ];

      final tickPaint = Paint()
        ..color = color.withOpacity(ticksProgress)
        ..strokeWidth = 3.0
        ..strokeCap = StrokeCap.round;

      const double innerTickRadius = radius + 12;
      const double outerTickRadius = radius + 20;

      for (double angle in tickAngles) {
        double x1 = center.dx + innerTickRadius * math.cos(angle);
        double y1 = center.dy + innerTickRadius * math.sin(angle);
        double x2 = center.dx + outerTickRadius * math.cos(angle);
        double y2 = center.dy + outerTickRadius * math.sin(angle);
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), tickPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant LeftToRightClockBookPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}