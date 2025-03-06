import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edetik_app/core/helper/result.dart';
import 'package:edetik_app/features/auth/login/data/login_datasource.dart';
import 'package:edetik_app/features/auth/register/page/register_page.dart';
import 'package:edetik_app/features/home/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ValueNotifier showPassword = ValueNotifier<bool>(true);
  ValueNotifier isLoading = ValueNotifier<bool>(false);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
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
                'Masukkan NIK dan Password anda untuk melanjutkan',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'NIK',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              TextField(
                inputFormatters: [
                  // length 16
                  LengthLimitingTextInputFormatter(16),
                ],
                controller: usernameController,
                keyboardType: TextInputType.number,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Masukkan NIK...',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
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
              Text(
                'Password',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              ValueListenableBuilder(
                valueListenable: showPassword,
                builder: (context, value, child) => TextField(
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  controller: passwordController,
                  obscureText: showPassword.value,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Masukkan Password...',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
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
              ValueListenableBuilder(
                valueListenable: isLoading,
                builder: (context, value, child) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      fixedSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.pink[400],
                    ),
                    onPressed: isLoading.value
                        ? null
                        : () async {
                            try {
                              isLoading.value = true;
                              LoginDatasource loginDatasource =
                                  LoginDatasource();
                              final result = await loginDatasource.login(
                                usernameController.text,
                                passwordController.text,
                              );
                              if (result is Ok && context.mounted) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              }
                            } on DioException catch (e) {
                              log('Gagal');
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text(e.response?.data['data']['msg']),
                                ),
                              );
                            } finally {
                              isLoading.value = false;
                            }
                          },
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  );
                },
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
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
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
      ),
    );
  }
}
