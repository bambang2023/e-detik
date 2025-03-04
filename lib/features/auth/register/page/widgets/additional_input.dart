import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../data/register_datasource.dart';
import '../../model/city_model.dart';
import '../../model/companion_model.dart';
import '../../model/desa_model.dart';
import '../../model/puskesmas_model.dart';
import '../../model/subdistrict_model.dart';
import '../register_notifier.dart';
import '../register_page.dart' show AuthRole;

class AdditionalInput extends StatefulWidget {
  final AuthRole role;
  const AdditionalInput({super.key, required this.role});

  @override
  State<AdditionalInput> createState() => _AdditionalInputState();
}

class _AdditionalInputState extends State<AdditionalInput> {
  RegisterDatasource registerDatasource = RegisterDatasource();

  @override
  Widget build(BuildContext context) {
    log(widget.role.toString());
    return widget.role == AuthRole.none ||
            widget.role == AuthRole.petugasProvinsi
        ? SizedBox()
        : Consumer<RegisterNotifier>(
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kabupaten/Kota',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  DropdownSearch<CityModel>(
                    items: (filter, loadProps) async {
                      List<CityModel> results =
                          await registerDatasource.readCity();
                      return results;
                    },
                    compareFn: (item1, item2) => item1.kdKabko == item2.kdKabko,
                    itemAsString: (item) => item.kabko,
                    onChanged: (newValue) {
                      value.setCityValue(newValue!.kdKabko);
                    },
                    popupProps: PopupProps.menu(
                      itemBuilder: (context, item, isDisabled, isSelected) {
                        return Container(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            item.kabko,
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
                        hintText: 'Pilih Kabupaten/Kota',
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
                  if (widget.role != AuthRole.petugasKabupaten)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Kecamatan',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        DropdownSearch<SubdistrictModel>(
                          enabled: value.citySelectedId != null,
                          items: (filter, loadProps) async {
                            List<SubdistrictModel> results =
                                await registerDatasource
                                    .readSubdistrict(value.citySelectedId!);
                            return results;
                          },
                          onChanged: (newValue) {
                            value.setSubdistrictValue(newValue!.kdKecamatan);
                          },
                          compareFn: (item1, item2) =>
                              item1.kdKecamatan == item2.kdKecamatan,
                          itemAsString: (item) => item.kecamatan,
                          popupProps: PopupProps.menu(
                            itemBuilder:
                                (context, item, isDisabled, isSelected) {
                              return Container(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  item.kecamatan,
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
                              hintText: 'Pilih Kecamatan',
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
                      ],
                    ),
                  if (widget.role != AuthRole.petugasKabupaten)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Puskesmas',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        DropdownSearch<PuskesmasModel>(
                          enabled: value.subdistrictSelectedId != null,
                          items: (filter, loadProps) async {
                            List<PuskesmasModel> results =
                                await registerDatasource.readPuskesmas(
                                    value.subdistrictSelectedId!);
                            return results;
                          },
                          onChanged: (newValue) {
                            value.setPuskesmasValue(newValue!.kdPuskesmas);
                          },
                          compareFn: (item1, item2) =>
                              item1.kdPuskesmas == item2.kdPuskesmas,
                          itemAsString: (item) => item.puskesmas,
                          popupProps: PopupProps.menu(
                            itemBuilder:
                                (context, item, isDisabled, isSelected) {
                              return Container(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  item.puskesmas,
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
                              hintText: 'Pilih Puskesmas',
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
                      ],
                    ),
                  if (widget.role == AuthRole.bidan ||
                      widget.role == AuthRole.ibuHamil ||
                      widget.role == AuthRole.pendamping)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Desa',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        DropdownSearch<DesaModel>(
                          enabled: value.subdistrictSelectedId != null,
                          items: (filter, loadProps) async {
                            List<DesaModel> results = await registerDatasource
                                .readDesa(value.subdistrictSelectedId!);
                            return results;
                          },
                          onChanged: (newValue) {
                            value.setDesaValue(newValue?.kdDesa);
                          },
                          compareFn: (item1, item2) =>
                              item1.kdDesa == item2.kdDesa,
                          itemAsString: (item) => item.desa,
                          popupProps: PopupProps.menu(
                            itemBuilder:
                                (context, item, isDisabled, isSelected) {
                              return Container(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  item.desa,
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
                              hintText: 'Pilih Desa',
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
                      ],
                    ),
                  if (widget.role == AuthRole.ibuHamil)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Pendamping',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        DropdownSearch<CompanionModel>(
                          onChanged: (newValue) {
                            value.setCompanionValue(newValue?.pendampingNik,
                                newValue?.pendampingName);
                          },
                          enabled: value.desaSelectedId != null,
                          items: (filter, loadProps) async {
                            List<CompanionModel> results =
                                await registerDatasource.readCompanion(
                                    value.desaSelectedId!,
                                    value.puskesmasSelectedId!);
                            return results;
                          },
                          compareFn: (item1, item2) =>
                              item1.pendampingNik == item2.pendampingNik,
                          itemAsString: (item) => item.pendampingName,
                          popupProps: PopupProps.menu(
                            itemBuilder:
                                (context, item, isDisabled, isSelected) {
                              return Container(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  item.pendampingName,
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
                              hintText: 'Pilih Pendamping',
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
                      ],
                    )
                ],
              );
            },
          );
  }
}
