import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Pastikan package ini sudah di-install
import 'home_screen.dart'; // <--- TAMBAHAN: Import halaman Home
import 'sign_up_screen.dart'; // <--- TAMBAHAN: Import halaman Sign Up

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = true;

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
            clipper: ExactWaveClipper(),
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

          // --- 3. KONTEN ABSOLUT ---
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
                          width: 200,
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
                                      bottomLeft: Radius.circular(
                                        2,
                                      ), // Sudut lancip persis desain
                                    ),
                                  ),
                                  child: Text(
                                    'sudah memiliki akun?',
                                    style: GoogleFonts.poppins(
                                      color: bgBlue,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              // Ikon Buku (Fallback garis jika gambar tidak ada)
                              Positioned(
                                top: -15,
                                child: Image.asset(
                                  'assets/images/target.png',
                                  height: 35,
                                  errorBuilder: (c, e, s) => const Icon(
                                    Icons.menu_book_rounded,
                                    color: Colors.white70,
                                    size: 35,
                                  ),
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
                                    errorBuilder: (c, e, s) => const Icon(
                                      Icons.edit,
                                      color: Colors.white70,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Teks Header
                        Text(
                          'Masuk',
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

                  // --- AREA FORM LOGIN ---
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
                          'silahkan masuk ke akun anda',
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

                        const SizedBox(height: 8),

                        // Ingat Saya & Lupa Sandi Presisi
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // Custom Checkbox agar bentuk kotak dan bordernya 100% sama
                                GestureDetector(
                                  onTap: () => setState(
                                    () => _rememberMe = !_rememberMe,
                                  ),
                                  child: Container(
                                    width: 14,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      color: _rememberMe
                                          ? textDarkBlue
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                        color: textDarkBlue,
                                        width: 1.2,
                                      ),
                                    ),
                                    child: _rememberMe
                                        ? const Icon(
                                            Icons.check,
                                            size: 10,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Ingat saya',
                                  style: GoogleFonts.poppins(
                                    color: textDarkBlue,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            // Tombol Lupa Sandi Berfungsi
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Lupa Sandi Ditekan'),
                                  ),
                                );
                              },
                              child: Text(
                                'Lupa Sandi?',
                                style: GoogleFonts.poppins(
                                  color: textDarkBlue,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: size.height * 0.035),

                        // --- UBAHAN: TOMBOL MASUK KE HOME ---
                        GestureDetector(
                          onTap: () {
                            // Pindah ke halaman Home dan hapus tumpukan layar sebelumnya
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
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
                                'Masuk',
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

                        // Garis "atau masuk dengan" (TETAP ADA)
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: fieldBorder.withOpacity(0.8),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Text(
                                'atau masuk dengan',
                                style: GoogleFonts.poppins(
                                  color: fieldBorder,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: fieldBorder.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: size.height * 0.03),

                        // Tombol Sosial Media Berfungsi (TETAP ADA)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Tombol Google
                            GestureDetector(
                              onTap: () =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Login Google'),
                                    ),
                                  ),
                              child: _buildSocialCircle(
                                'assets/images/google_icon.png',
                                const Color(0xFFDB4437),
                                'G',
                              ),
                            ),
                            const SizedBox(width: 24),
                            // Tombol FB
                            GestureDetector(
                              onTap: () =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Login Facebook'),
                                    ),
                                  ),
                              child: _buildSocialCircle(
                                'assets/images/fb_icon.png',
                                const Color(0xFF1877F2),
                                'f',
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: size.height * 0.035),

                        // --- UBAHAN: TEKS BUAT AKUN KE SIGN UP ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Belum terdaftar? ',
                              style: GoogleFonts.poppins(
                                color: fieldBorder,
                                fontSize: 12,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Pindah ke halaman Sign Up asli
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'buat akun',
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

  // --- WIDGET BANTUAN AKURAT ---

  // Pembuat Titik Bokeh Putih & Biru Akurat
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

  // Pembuat Text Field Kustom tanpa elemen default material
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
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ), // Padding diseimbangkan
          isDense: true,
        ),
      ),
    );
  }

  // Pembuat Lingkaran Sosial Media
  Widget _buildSocialCircle(
    String imagePath,
    Color fallbackColor,
    String fallbackText,
  ) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xFFABCDEF), // Warna biru muda spesifik di gambar
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: 22,
          height: 22,
          // Fallback jika kamu belum punya gambar logo google/fb
          errorBuilder: (context, error, stackTrace) => Text(
            fallbackText,
            style: GoogleFonts.poppins(
              color: fallbackColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// --- ENGINE PEMOTONG GELOMBANG BIRU PRESISI TINGGI ---
class ExactWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // Titik mulai dari kiri (tinggi sekitar 65% dari wadah biru)
    path.lineTo(0, size.height * 0.65);

    // Lengkungan turun ke tengah-kiri
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.95,
      size.width * 0.55,
      size.height * 0.85,
    );

    // Lengkungan naik menyapu ke kanan atas
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.72,
      size.width,
      size.height * 0.60,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
