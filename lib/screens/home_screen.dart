import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavigationIndex = 0; // Mengontrol menu aktif di bottom nav

  // Fungsi interaktif saat node pembelajaran peta diklik
  void _onLevelNodeTapped(String levelName) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF163C69),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Materi: $levelName',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Siap untuk memulai petualangan belajarmu di sub-bab ini? Selesaikan misi untuk mendapatkan lencana bintang baru.',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.white70),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBF8B6F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Mulai Belajar',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color textDarkBlue = Color(0xFF163C69);
    const Color lineBlue = Color(0xFF4C7EBE);
    const Color bgKrem = Color(0xFFF3F2EB);
    const Color barProgressBg = Color(0xFFD0D0CE);
    const Color barProgressColor = Color(0xFFBF8B6F);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgKrem,
      // APP BAR CUSTOM BULAT
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          backgroundColor: textDarkBlue,
          elevation: 0,
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
          ),
          title: Row(
            children: [
              Image.asset(
                'assets/images/mascot.png',
                height: 32,
                errorBuilder: (c, e, s) =>
                    const Icon(Icons.face, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Text(
                'cendekiaid',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF82ACDA),
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.whatshot,
                color: barProgressColor,
                size: 28,
              ),
              onPressed: () {},
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {},
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),

      // LAYOUT UTAMA DENGAN MAP DUA DIMENSI
      body: Stack(
        children: [
          // JIKA INDEX = 0 BUKA MAP BELAJAR (Sesuai Desain Utama)
          _currentNavigationIndex == 0
              ? SingleChildScrollView(
                  child: SizedBox(
                    width: size.width,
                    height: 950,
                    child: Stack(
                      children: [
                        // PROGRESS INDICATOR ATAS
                        Positioned(
                          top: 24,
                          left: 24,
                          right: 24,
                          child: Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: 0.6,
                                    backgroundColor: barProgressBg,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          barProgressColor,
                                        ),
                                    minHeight: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                '3/5',
                                style: GoogleFonts.poppins(
                                  color: textDarkBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // DRAW ENGINE: LINE MAP ZIGZAG KUSTOM
                        CustomPaint(
                          size: Size(size.width, 900),
                          painter: MapLinePainter(lineColor: lineBlue),
                        ),

                        // NODES/TOMBOL LEVEL AKTIF (Bisa diklik semuanya)
                        _buildMapNode(
                          top: 110,
                          left: 55,
                          icon: Icons.question_mark,
                          label: "Pengenalan Misi",
                        ),
                        _buildMapNode(
                          top: 250,
                          right: 55,
                          icon: Icons.wb_cloudy_outlined,
                          label: "Tantangan Cuaca",
                        ),
                        _buildMapNode(
                          top: 390,
                          left: size.width / 2 - 35,
                          icon: Icons.explore_outlined,
                          label: "Arah Petualangan",
                        ),
                        _buildMapNode(
                          top: 540,
                          right: size.width / 2 - 35,
                          icon: Icons.alarm,
                          label: "Manajemen Waktu",
                        ),
                        _buildMapNode(
                          top: 690,
                          left: 65,
                          icon: Icons.beach_access,
                          label: "Zona Istirahat",
                        ),

                        // MASKOT DEKORASI RENDERAN 3D
                        Positioned(
                          top: 320,
                          left: 20,
                          child: Image.asset(
                            'assets/images/mascot.png',
                            height: 90,
                            errorBuilder: (c, e, s) => const SizedBox(),
                          ),
                        ),
                        Positioned(
                          top: 480,
                          right: 25,
                          child: Transform.scale(
                            scaleX: -1,
                            child: Image.asset(
                              'assets/images/mascot.png',
                              height: 85,
                              errorBuilder: (c, e, s) => const SizedBox(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    'Halaman Menu Konten ${_currentNavigationIndex + 1}\nFitur Berjalan Aktif!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: textDarkBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

          // BADGE CHIPS FLOATING DI ATAS NAVIGASI BAWAH
          if (_currentNavigationIndex == 0) ...[
            Positioned(bottom: 95, left: 24, child: _buildFloatingBadge("52%")),
            Positioned(
              bottom: 95,
              left: 95,
              child: _buildFloatingBadge("kelas 10"),
            ),
          ],

          // CUSTOM BOTTOM NAVIGATION BAR (TUMPANG TINDIH BENAM)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                color: const Color(0xFFCBE3F7),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomIcon(0, Icons.home_filled),
                  _buildBottomIcon(1, Icons.chat_bubble_outline_rounded),
                  _buildBottomIcon(
                    2,
                    Icons.menu_book_rounded,
                  ), // Bagian Buku Tengah Tumpang Tindih
                  _buildBottomIcon(3, Icons.auto_awesome_outlined),
                  _buildBottomIcon(4, Icons.person_outline_rounded),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET GENERATOR NODE PETA BELAJAR
  Widget _buildMapNode({
    required double top,
    double? left,
    double? right,
    required IconData icon,
    required String label,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: GestureDetector(
        onTap: () => _onLevelNodeTapped(label),
        child: Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            color: const Color(0xFF132D52),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF4C7EBE), width: 3),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4C7EBE).withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
      ),
    );
  }

  // FLOATING BADGE KUSTOM
  Widget _buildFloatingBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD0D0CE), width: 1.5),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF163C69),
        ),
      ),
    );
  }

  // ITEM BOTTOM NAVIGATION BAR DENGAN EVENT SELECTION AKTIF
  Widget _buildBottomIcon(int index, IconData icon) {
    bool isSelected = _currentNavigationIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentNavigationIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: index == 2
                  ? 34
                  : 26, // Membuat ikon buku tengah lebih besar menonjol
              color: isSelected
                  ? const Color(0xFF163C69)
                  : const Color(0xFF6B8FB4),
            ),
            if (isSelected) ...[
              const SizedBox(height: 4),
              Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  color: Color(0xFF163C69),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ENGINE LINE PAINTER PUTUS-PUTUS ZIGZAG MAP
class MapLinePainter extends CustomPainter {
  final Color lineColor;
  MapLinePainter({required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = lineColor
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    // Hitung koordinat antar titik node
    Offset p1 = const Offset(55 + 34, 110 + 34);
    Offset p2 = Offset(size.width - 55 - 34, 250 + 34);
    Offset p3 = Offset(size.width / 2, 390 + 34);
    Offset p4 = Offset(size.width / 2, 540 + 34);
    Offset p5 = const Offset(65 + 34, 690 + 34);

    _drawDashedLine(canvas, p1, p2, paint);
    _drawDashedLine(canvas, p2, p3, paint);
    _drawDashedLine(canvas, p3, p4, paint);
    _drawDashedLine(canvas, p4, p5, paint);
  }

  void _drawDashedLine(Canvas canvas, Offset p1, Offset p2, Paint paint) {
    const dashWidth = 8.0;
    const dashSpace = 6.0;
    double distance = (p2 - p1).distance;
    int dashCount = (distance / (dashWidth + dashSpace)).floor();
    for (int i = 0; i < dashCount; i++) {
      double startPercent = (i * (dashWidth + dashSpace)) / distance;
      double endPercent = (i * (dashWidth + dashSpace) + dashWidth) / distance;
      canvas.drawLine(
        Offset(
          p1.dx + (p2.dx - p1.dx) * startPercent,
          p1.dy + (p2.dy - p1.dy) * startPercent,
        ),
        Offset(
          p1.dx + (p2.dx - p1.dx) * endPercent,
          p1.dy + (p2.dy - p1.dy) * endPercent,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
