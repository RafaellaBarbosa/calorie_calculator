import 'package:flutter/material.dart';

class CardCalorieWidget extends StatelessWidget {
  const CardCalorieWidget(
      {super.key, required this.title, required this.calories});

  final String title;
  final String calories;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              calories,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
