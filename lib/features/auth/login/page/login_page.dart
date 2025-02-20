import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ValueNotifier showPassword = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Selamat Datang',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Masukkan Email dan Password anda untuk melanjutkan',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(),
            ),
            SizedBox(
              height: 80,
            ),
            Text('Email', style: GoogleFonts.poppins()),
            SizedBox(
              height: 2,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(
                  Icons.person,
                  size: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text('Password', style: GoogleFonts.poppins()),
            SizedBox(
              height: 2,
            ),
            ValueListenableBuilder(
              valueListenable: showPassword,
              builder: (context, value, child) => TextField(
                obscureText: showPassword.value,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 22,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      showPassword.value = !showPassword.value;
                    },
                    icon: showPassword.value
                        ? const Icon(
                            Icons.visibility,
                            size: 22,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            size: 22,
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Lupa password?',
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 2,
                fixedSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                foregroundColor: Colors.white,
                backgroundColor: Colors.pink[400],
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
            SizedBox(
              height: 16,
            ),
            Divider(
              thickness: 1,
              color: Colors.grey[400],
              indent: 40,
              endIndent: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum punya akun?',
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.pink[400],
                  ),
                  onPressed: () {},
                  child: Text(
                    'Daftar',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
