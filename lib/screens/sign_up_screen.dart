import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_in_screen.dart'; // Mengambil ExactWaveClipper dari file Sign In

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Palet Warna Akurat dari Desain
    const Color bgBlue = Color(0xFF4879BC);
    const Color bgBeige = Color(0xFFF3F2EB);
    const Color textDarkBlue = Color(0xFF163C69);
    const Color fieldBg = Color(0xFFD0E0F5);
    const Color fieldBorder = Color(0xFF82ACDA);
    const Color btnBlue = Color(0xFF5185CA);

    // Tinggi dan Lebar Layar
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgBeige,
      // Mengunci layar agar FIT 1 LAYAR dan TIDAK BISA di-scroll
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // --- 1. BACKGROUND GELOMBANG BIRU ---
          ClipPath(
            clipper: ExactWaveClipper(), // Memakai Clipper dari sign_in_screen
            child: Container(
              height: size.height * 0.44,
              width: size.width,
              color: bgBlue,
            ),
          ),

          // --- 2. TITIK-TITIK CAHAYA (BOKEH AKURAT) ---
          // Titik Putih di Area Biru
          _buildDot(
            size.width * 0.15,
            size.height * 0.05,
            12,
            Colors.white.withOpacity(0.8),
          ),
          _buildDot(
            size.width * 0.58,
            size.height * 0.12,
            16,
            Colors.white.withOpacity(0.9),
          ),
          _buildDot(
            size.width * 0.08,
            size.height * 0.38,
            14,
            Colors.white.withOpacity(0.8),
          ),
          _buildDot(
            size.width * 0.95,
            size.height * 0.25,
            12,
            Colors.white.withOpacity(0.6),
          ),
          _buildDot(
            size.width * 0.8,
            size.height * 0.40,
            10,
            Colors.white.withOpacity(0.5),
          ),
          _buildDot(
            size.width * 0.45,
            size.height * 0.48,
            14,
            Colors.white.withOpacity(0.4),
          ),

          // Titik Biru Gelap di Area Beige
          _buildDot(-10, size.height * 0.55, 18, textDarkBlue.withOpacity(0.6)),
          _buildDot(
            size.width * 0.96,
            size.height * 0.82,
            16,
            textDarkBlue.withOpacity(0.6),
          ),
          _buildDot(-5, size.height * 0.92, 14, textDarkBlue.withOpacity(0.6)),

          // --- 3. KONTEN UTAMA ---
          SafeArea(
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- AREA ILUSTRASI & HEADER ---
                  SizedBox(
                    height: size.height * 0.35,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: size.height * 0.04),
                        // Komposisi Maskot
                        SizedBox(
                          width: 220,
                          height: 120,
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              // Maskot Utama
                              Positioned(
                                bottom: 0,
                                child: Image.asset(
                                  'assets/images/mascot.png',
                                  height: 85,
                                ),
                              ),
                              // Chat Bubble Akurat
                              Positioned(
                                right: -15,
                                top: 15,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(2),
                                    ),
                                  ),
                                  child: Text(
                                    'buat akun?',
                                    style: GoogleFonts.poppins(
                                      color: bgBlue,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              // Ikon Buku
                              Positioned(
                                top: -15,
                                child: Image.asset(
                                  'assets/images/target.png',
                                  height: 35,
                                ),
                              ),
                              // Ikon Pensil
                              Positioned(
                                left: 10,
                                bottom: 20,
                                child: Transform.rotate(
                                  angle: -0.5,
                                  child: Image.asset(
                                    'assets/images/draft.png',
                                    height: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Teks Header Presisi
                        Text(
                          'Daftar',
                          style: GoogleFonts.poppins(
                            fontSize: 44,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: 0.5,
                            height: 1.1,
                          ),
                        ),
                        Text(
                          'Jelajah Ilmu, Kuasai Dunia',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // --- AREA FORM REGISTRASI ---
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.05),

                        // Teks Selamat Datang Presisi
                        Text(
                          'Selamat Datang',
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: textDarkBlue,
                            letterSpacing: -0.5,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'silahkan daftarkan akun anda',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: textDarkBlue,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: size.height * 0.025),

                        // Form E-mail
                        Text(
                          'E-mail',
                          style: GoogleFonts.poppins(
                            color: textDarkBlue,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 4),
                        _buildExactTextField(
                          _emailController,
                          fieldBg,
                          fieldBorder,
                          false,
                        ),

                        SizedBox(height: size.height * 0.02),

                        // Form Sandi
                        Text(
                          'Sandi',
                          style: GoogleFonts.poppins(
                            color: textDarkBlue,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 4),
                        _buildExactTextField(
                          _passwordController,
                          fieldBg,
                          fieldBorder,
                          true,
                        ),

                        SizedBox(height: size.height * 0.035),

                        // Tombol Daftar Presisi
                        GestureDetector(
                          onTap: () {
                            print("Proses Pendaftaran Akun");
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48,
                            decoration: BoxDecoration(
                              color: btnBlue,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: textDarkBlue.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Daftar',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: size.height * 0.035),

                        // Teks Pindah ke Halaman Masuk
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sudah memiliki akun? ',
                              style: GoogleFonts.poppins(
                                color: textDarkBlue,
                                fontSize: 12,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(
                                  context,
                                ); // Kembali ke SignInScreen
                              },
                              child: Text(
                                'Masuk',
                                style: GoogleFonts.poppins(
                                  color: textDarkBlue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET BANTUAN INTERNAL ---

  // Pembuat Titik Bokeh Putih & Biru
  Widget _buildDot(double x, double y, double size, Color color) {
    return Positioned(
      left: x,
      top: y,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.6),
              blurRadius: size * 0.8,
              spreadRadius: size * 0.3,
            ),
          ],
        ),
      ),
    );
  }

  // Pembuat Text Field Kustom tanpa distorsi material
  Widget _buildExactTextField(
    TextEditingController controller,
    Color fillColor,
    Color borderColor,
    bool isPassword,
  ) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: const Color(0xFF163C69),
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          isDense: true,
        ),
      ),
    );
  }
}
