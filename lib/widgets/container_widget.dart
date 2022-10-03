import 'package:authentication/util/colors.dart';
import 'package:authentication/util/dimensions.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Widget widget;
  final Color color;
  final double width;
  final double height;
  final Color? borderColor;

  const ContainerWidget({
    Key? key,
    required this.widget,
    required this.color,
    required this.width,
    required this.height,
    this.borderColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        border: Border.all(
          color: borderColor ?? AppColors.TRANSPARENT,
          width: 1,
        )
      ),
      child: Center(child: widget),
    );
  }
}
