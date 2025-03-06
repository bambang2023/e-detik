import 'package:edetik_app/features/auth/register/page/register_notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InputDatepicker extends StatelessWidget {
  const InputDatepicker({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.prefixIcon,
  });

  final TextEditingController controller;
  final String label, hint;
  final IconData prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        StatefulBuilder(
          builder: (context, setState) => TextField(
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            readOnly: true,
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                String requestFormatDate =
                    DateFormat('yyyy-MM-dd').format(picked);
                String userFormatDate = DateFormat(
                  'dd MMMM yyyy',
                ).format(
                  picked,
                );

                setState(() {
                  controller.text = userFormatDate;
                  context.read<RegisterNotifier>().dateSelected =
                      requestFormatDate;
                });
              }
            },
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.grey[200],
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(
                prefixIcon,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
