import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    this.controller,
    this.isSecret = false,
    required this.isObscure,
    this.hintText,
    required this.icon,
  }) : super(key: key);

  final String? hintText;
  final TextEditingController? controller;
  final bool isSecret;
  final bool isObscure;
  final IconData icon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // * Obscure text while typing
  bool isObscure = false;

  @override
  void initState() {
    isObscure = widget.isSecret;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      decoration: InputDecoration(
        isDense: true,
        prefixIconConstraints: BoxConstraints(
          maxHeight: 80,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        fillColor: Colors.grey.shade100,
        filled: true,
        hintText: widget.hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8),
          child: FaIcon(
            widget.icon,
          ),
        ),
        suffixIcon: widget.isSecret
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                  isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              )
            : null,
      ),
    );
  }
}
