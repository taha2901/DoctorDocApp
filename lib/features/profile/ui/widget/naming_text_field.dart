
import 'package:flutter/material.dart';

class NamingTextField extends StatelessWidget {
  final String name;
  const NamingTextField({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[600],
        fontWeight: FontWeight.w500,
      ),
    );
  }
}