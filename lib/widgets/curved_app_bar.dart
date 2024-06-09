import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurvedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedClipper(),
      child: Container(
        height: 150.0, // AppBar yüksekliği
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.menu, // Menü ikonu
              color: Colors.yellow, // İkon rengi
              size: 30.0, // İkon boyutu
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Drawer'ı aç
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search, // Arama ikonu
                color: Colors.white,
              ),
              onPressed: () {
                // Arama işlevselliği eklenebilir
              },
            ),
          ],
          title: const Text(
            'Özlü Söz Uygulaması', // Başlık metni
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150.0); // AppBar boyutu
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30); // Eğrinin alt noktası
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 30); // Eğri
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
