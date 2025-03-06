import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:edetik_app/features/auth/register/page/widgets/additional_input.dart';
import 'package:edetik_app/features/widgets/input_datepicker.dart';
import 'package:edetik_app/features/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../data/register_datasource.dart';
import 'register_notifier.dart';

enum AuthRole implements Comparable<AuthRole> {
  ibuHamil('ibu hamil'),
  pendamping('pendamping'),
  bidan('bidan'),
  petugasPuskesmas('petugas puskesmas'),
  petugasKabupaten('petugas kabupaten'),
  none('none'),
  petugasProvinsi('petugas provinsi');

  @override
  int compareTo(AuthRole other) {
    return title.compareTo(other.title);
  }

  final String title;

  const AuthRole(this.title);
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController subdistrictController = TextEditingController();

  final TextEditingController desaController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObsecure = true;

  late List<TextEditingController> controllers = [
    nameController,
    nikController,
    passwordController,
    birthDateController
  ];
  AuthRole roleSelected = AuthRole.none;

  @override
  void initState() {
    super.initState();
    context.read<RegisterNotifier>().clearAll();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:
                        Icon(Icons.chevron_left, color: Colors.black, size: 32),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Buat Akun Baru',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Silahkan buat akun baru untuk melanjutkan',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                InputField(
                  controller: nameController,
                  hint: 'Masukkan Nama Anda',
                  label: 'Nama',
                  prefixIcon: Icons.person,
                ),
                SizedBox(
                  height: 16,
                ),
                InputField(
                  inputFormatters: [LengthLimitingTextInputFormatter(16)],
                  validator: (value) {
                    if (value!.length != 16) {
                      return 'NIK Harus Diisi 16 Digit';
                    }
                    return null;
                  },
                  controller: nikController,
                  hint: 'NIK Diisi 16 Digit',
                  label: 'NIK',
                  inputType: TextInputType.number,
                  prefixIcon: Icons.person,
                ),
                SizedBox(
                  height: 16,
                ),
                InputField(
                  controller: passwordController,
                  hint: 'Masukkan Password Anda',
                  label: 'Password',
                  obscureText: isObsecure,
                  prefixIcon: Icons.lock,
                  suffixIcon: IconButton(
                    onPressed: () {
                      isObsecure = !isObsecure;
                      setState(() {});
                    },
                    icon: const Icon(Icons.visibility),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                InputDatepicker(
                  controller: birthDateController,
                  label: 'Tanggal Lahir',
                  hint: 'Pilih Tanggal Lahir',
                  prefixIcon: Icons.calendar_month,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Pilih Peran',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                DropdownSearch<AuthRole>(
                  selectedItem: roleSelected,
                  items: (filter, loadProps) {
                    return [
                      AuthRole.ibuHamil,
                      AuthRole.pendamping,
                      AuthRole.bidan,
                      AuthRole.petugasPuskesmas,
                      AuthRole.petugasKabupaten,
                      AuthRole.petugasProvinsi
                    ];
                  },
                  compareFn: (item1, item2) => item1 == item2,
                  onChanged: (value) {
                    roleSelected = value!;
                    setState(() {});
                  },
                  itemAsString: (item) => item.title,
                  popupProps: PopupProps.menu(
                    itemBuilder: (context, item, isDisabled, isSelected) {
                      return Container(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          item.title,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                  ),
                  decoratorProps: DropDownDecoratorProps(
                    baseStyle: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Pilih Peran Anda',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.location_city_outlined,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                AdditionalInput(role: roleSelected),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 48,
                  child: Consumer<RegisterNotifier>(
                    builder: (context, value, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.pink[400],
                        ),
                        onPressed: roleSelected == AuthRole.none
                            ? null
                            : () async {
                                try {
                                  if (formKey.currentState!.validate()) {
                                    RegisterDatasource registerDatasource =
                                        RegisterDatasource();
                                    await registerDatasource.createUser({
                                      'sebagai': roleSelected.title,
                                      'nama': nameController.text,
                                      'nik': nikController.text,
                                      'password': passwordController.text,
                                      'tgl_lahir': value.dateSelected,
                                      if (value.citySelectedId != null)
                                        'kabupaten': value.citySelectedId,
                                      if (value.subdistrictSelectedId != null)
                                        'kecamatan':
                                            value.subdistrictSelectedId,
                                      if (value.desaSelectedId != null)
                                        'desa': value.desaSelectedId,
                                      if (value.puskesmasSelectedId != null)
                                        'puskesmas': value.puskesmasSelectedId,
                                      if (value.companionSelectedId !=
                                          null) ...{
                                        'pendamping_nik':
                                            value.companionSelectedId,
                                        'pendamping_name': value.companionName
                                      }
                                    });
                                    for (var controller in controllers) {
                                      controller.clear();
                                    }
                                    roleSelected = AuthRole.none;
                                    setState(() {});
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Pendaftaran Berhasil'),
                                        ),
                                      );
                                    }
                                  }
                                } on DioException catch (e) {
                                  if (!context.mounted) return;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(e
                                          .response!.data['data']['msg']
                                          .toString()),
                                    ),
                                  );
                                }
                              },
                        child: Text(
                          'Simpan',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// NOTE:
// 1. VISIBLE PASSWORD
// 2. MAXLENGTH NIK
// 3. TANGGAL 2 VALUE SHOW USER DAN REQUEST API