import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final double height;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool isObscureText;
  final String? obscureCharacter;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.height,
    required this.controller,
    this.keyboardType,
    required this.isObscureText,
    this.obscureCharacter = '•', // Providing a default obscure character
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isObscureText,
        obscuringCharacter: obscureCharacter ?? '*',
        style: GoogleFonts.montserrat(
          color: Colors.black87,
          fontSize: 12.0,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 12.0, left: 12.0),
          filled: true,
          fillColor: Colors.white70,
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(height / 4),
            borderSide: const BorderSide(
              color: Colors.black38,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(height / 4),
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(height / 4),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
