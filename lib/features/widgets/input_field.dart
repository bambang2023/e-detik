import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    this.inputType,
    this.obscureText = false,
    this.validator,
    this.inputFormatters,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String label, hint;
  final IconData prefixIcon;
  final TextInputType? inputType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;

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
        TextFormField(
          inputFormatters: inputFormatters,
          validator: validator,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          obscureText: obscureText,
          keyboardType: inputType,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
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
      ],
    );
  }
}
