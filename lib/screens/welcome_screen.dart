  import 'dart:ui';
import 'package:flutter/material.dart';
import 'sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF3F6FA,
      ), // Warna dasar krem/putih kebiruan
      body: Stack(
        children: [
          // --- LAPISAN 1: BACKGROUND BLOB (Bercak Biru) ---
          Positioned(top: -50, left: -50, child: _buildBlob(200)),
          Positioned(top: 150, right: -40, child: _buildBlob(140)),
          Positioned(top: 400, left: -60, child: _buildBlob(120)),
          Positioned(bottom: -50, right: -50, child: _buildBlob(250)),
          Positioned(bottom: 100, left: -20, child: _buildBlob(180)),

          // --- LAPISAN 2: EFEK BLUR GLOBAL UNTUK BACKGROUND ---
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 45, sigmaY: 45),
              child: Container(color: Colors.transparent),
            ),
          ),

          // --- LAPISAN 3: KONTEN UTAMA ---
          SafeArea(
            bottom: false, // Membiarkan bottom sheet menyentuh dasar layar
            child: Column(
              children: [
                // Bagian Atas: Maskot & Judul Aplikasi
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Gambar Maskot Melambai
                        Image.asset(
                          'assets/images/mascot_welcome.png',
                          height: 220,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 16),
                        // Teks Logo cendekiaid
                        Text(
                          'cendekiaid',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF6592D6), // Biru logo
                            letterSpacing: -1,
                            shadows: [
                              Shadow(
                                color: Colors.blue.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Tagline
                        const Text(
                          'Jelajah Ilmu, Kuasai Dunia',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1B406A), // Biru tua/Navy
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bagian Bawah: Bottom Sheet (Glassmorphism)
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(
                        0.4,
                      ), // Warna dasar transparan
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(
                          0.6,
                        ), // Efek garis tepi kaca
                        width: 1.5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32.0,
                            vertical: 24.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Handle (Garis pendek di tengah atas)
                              Center(
                                child: Container(
                                  width: 40,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF4C7EBE),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),

                              // Judul Teks
                              const Text(
                                'Mulai belajar,\nkapan saja, di mana saja.',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1B2C56),
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Subjudul Teks
                              const Text(
                                'Ilmu tidak mengenal usia. Bersama cendekiaid,\nperjalanan belajarmu dimulai hari ini dan tidak\npernah berhenti.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF3A4A62),
                                  height: 1.5,
                                ),
                              ),
                              const Spacer(),

                              // Tombol Mulai
                              Center(
                                child: SizedBox(
                                  width:
                                      200, // Menyesuaikan lebar tombol di desain
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SignInScreen(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF4C7EBE),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      elevation:
                                          5, // Sedikit bayangan pada tombol
                                      shadowColor: const Color(
                                        0xFF4C7EBE,
                                      ).withOpacity(0.5),
                                    ),
                                    child: const Text(
                                      'Mulai',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi bantuan untuk membuat bercak gradasi (blobs) di background
  Widget _buildBlob(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF7BA6E3).withOpacity(0.4), // Warna biru lembut
      ),
    );
  }
}

// =====================================================================
// HALAMAN DUMMY: Untuk membuktikan bahwa tombol "Mulai" berfungsi penuh
// =====================================================================
class DummyNextScreen extends StatelessWidget {
  const DummyNextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Selanjutnya'),
        backgroundColor: const Color(0xFF4C7EBE),
      ),
      body: const Center(
        child: Text(
          'Fitur Navigasi Berfungsi!\nTombol "Mulai" sukses diklik.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}