import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    this.color,
    this.borderRadius = 14,
    this.child,
    this.height,
    this.padding,
    this.margin,
    this.width,
  });

  final Color? color;
  final double borderRadius;
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(9),
      padding: padding ?? const EdgeInsets.all(6),
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 200,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: child,
    );
  }
}
