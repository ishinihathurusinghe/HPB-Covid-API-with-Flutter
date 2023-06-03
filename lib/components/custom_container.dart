import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    super.key,
    required this.size,
    required this.title,
    required this.value,
    required this.color,
  });

  final Size size;
  String title;
  int value;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width * 0.4,
        height: 100,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              value.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}