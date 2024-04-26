import 'package:flutter/material.dart';

class SizeCard extends StatelessWidget {
  const SizeCard({
    super.key,
    required this.title,
    required this.select,
    required this.icon,
  });

  final String title;
  final Color select;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        icon,
        Text(
          title,
          style: TextStyle(color: select),
        ),
      ],
    );
  }
}
