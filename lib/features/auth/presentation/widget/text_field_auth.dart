import 'package:coffee_shop/common/app_color.dart';
import 'package:flutter/material.dart';

class TextFieldAuth extends StatefulWidget {
  const TextFieldAuth({
    super.key,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.suffixIcon = false,
    required this.icon,
  });

  final TextEditingController? controller;
  final String? hintText;
  final IconData icon;
  final bool obscureText;
  final bool suffixIcon;

  @override
  State<TextFieldAuth> createState() => _TextFieldAuthState();
}

class _TextFieldAuthState extends State<TextFieldAuth> {
  bool isCheck = true;
  void _onChange() {
    setState(() {
      isCheck = !isCheck;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText ? isCheck : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(
          widget.icon,
          color: primary,
        ),
        suffixIcon: widget.suffixIcon
            ? InkWell(
                onTap: _onChange,
                child: Icon(
                  isCheck ? Icons.visibility_off : Icons.visibility,
                  color: primary,
                ),
              )
            : null,
        filled: true,
        fillColor: filedFieldColor,
        contentPadding: const EdgeInsets.all(0),
        constraints: const BoxConstraints(maxHeight: 46),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: primary,
          ),
        ),
      ),
    );
  }
}
