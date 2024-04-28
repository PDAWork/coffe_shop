import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SizeCard extends StatelessWidget {
  const SizeCard({
    super.key,
    required this.title,
    required this.select,
    required this.iconPath,
  });

  final String title;
  final Color select;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 300),
        tween: ColorTween(begin: select, end: select),
        builder: (BuildContext context, Color? value, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(value as Color, BlendMode.srcIn),
              ),
              Text(
                title,
                style: TextStyle(color: value),
              ),
            ],
          );
        });
  }
}
