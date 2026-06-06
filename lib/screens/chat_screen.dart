import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color bgBeige = Color(0xFFF3F2EB);
    const Color textDarkBlue = Color(0xFF163C69);
    const Color fieldBg = Color(0xFFE5E5E0); // Warna search bar

    final List<Map<String, String>> friends = [
      {"name": "Raka", "msg": "Proges lu gimana bro?"},
      {"name": "Rachel", "msg": "Proges lu gimana bro?"},
      {"name": "Vanya", "msg": "Proges lu gimana bro?"},
      {"name": "Tania", "msg": "Proges lu gimana bro?"},
      {"name": "Sonia", "msg": "Proges lu gimana bro?"},
      {"name": "Kania", "msg": "Proges lu gimana bro?"},
      {"name": "Elin", "msg": "Proges lu gimana bro?"},
    ];

    return Scaffold(
      backgroundColor: bgBeige,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/mascot.png', height: 30),
                      const SizedBox(width: 8),
                      Text(
                        'cendekiaid',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: textDarkBlue,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.notifications_none,
                    color: textDarkBlue,
                    size: 28,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFF4879BC)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari disini',
                    hintStyle: GoogleFonts.poppins(
                      color: textDarkBlue.withOpacity(0.5),
                    ),
                    suffixIcon: const Icon(Icons.search, color: textDarkBlue),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Filter Chips
              Row(
                children: [
                  _buildFilterChip("Semua", true),
                  _buildFilterChip("belum dibaca", false),
                  _buildFilterChip("Favorit", false),
                  _buildFilterChip("gambar", false),
                ],
              ),
              const SizedBox(height: 20),

              // List Chat
              Expanded(
                child: ListView.separated(
                  itemCount: friends.length,
                  separatorBuilder: (c, i) => const SizedBox(height: 16),
                  itemBuilder: (c, i) => Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.grey.shade300,
                        child: Text(friends[i]['name']![0]),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            friends[i]['name']!,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: textDarkBlue,
                            ),
                          ),
                          Text(
                            friends[i]['msg']!,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: textDarkBlue.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF4879BC) : const Color(0xFFD0D0CE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 11,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
