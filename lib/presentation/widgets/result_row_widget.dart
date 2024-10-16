import 'package:flutter/material.dart';

class ResultRowWidget extends StatelessWidget {
  const ResultRowWidget({
    super.key,
    required this.label,
    required this.value,
    this.hasDivider = true,
  });
  final String label;
  final String value;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          if (hasDivider) const Divider(),
        ],
      ),
    );
  }
}
