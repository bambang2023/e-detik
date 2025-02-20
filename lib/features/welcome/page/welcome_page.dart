import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/bg-edetik.png',
                    width: 260,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Selamat Datang di E-Detik\nPendamping kesehatan ibu hamil berisiko tinggi.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.pink[400],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 24,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.pink[400],
                      ),
                      onPressed: () {},
                      child: Text(
                        'Buat Akun',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        foregroundColor: Colors.pink[400],
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Masuk',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
