import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFildWidget extends StatelessWidget {
  const TextFormFildWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.keyboardType,
    this.validator,
    this.hintText,
    this.textInputAction,
    this.inputFormatters,
  });

  final String? label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) Text(label!),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hintText,
            ),
            validator: validator,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
          ),
        ],
      ),
    );
  }
}
