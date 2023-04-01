import 'package:chuong4/unit_5/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainText extends StatelessWidget {
  final String title;
  final Gradient? backGroundGradient;
  final bool? isPoint;

  const ContainText({
    Key? key,
    required this.title,
    this.backGroundGradient,
    this.isPoint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        gradient:
            isPoint ?? false ? null : backGroundGradient ?? AppColors.menuOpa,
        color: isPoint ?? false ? AppColors.yellow : null,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: isPoint ?? false
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.ideographic,
              children: [
                SizedBox(
                  height: 8,
                  child: SvgPicture.asset(
                    'assets/svgs/imdb.svg',
                    width: 14,
                    height: 5,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  '8.5',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 6,
                  ),
                ),
              ],
            )
          : Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
