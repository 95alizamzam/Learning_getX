import 'package:flutter/material.dart';

enum AppLoaderShape { linear, circular }

class AppLoader extends StatelessWidget {
  const AppLoader._({
    this.isCentrized,
    this.value,
    this.shape,
    this.backgroundColor,
    this.size,
    this.color,
    this.strokeWidth,
    super.key,
  });

  final double? value, size, strokeWidth;
  final AppLoaderShape? shape;
  final Color? backgroundColor, color;
  final bool? isCentrized;

  factory AppLoader.circular({
    double? value,
    Color? backgroundColor,
    Color? color,
    double? size,
    double? strokeWidth,
    bool? isCentrized,
  }) {
    return AppLoader._(
      shape: AppLoaderShape.circular,
      value: value,
      backgroundColor: backgroundColor,
      color: color,
      size: size,
      strokeWidth: strokeWidth,
      isCentrized: isCentrized ?? true,
    );
  }

  factory AppLoader.linear({
    double? value,
    Color? backgroundColor,
    Color? color,
    double? size,
  }) {
    return AppLoader._(
      shape: AppLoaderShape.linear,
      value: value,
      backgroundColor: backgroundColor,
      color: color,
      size: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    late Widget loader;
    if (shape == AppLoaderShape.circular && value != null) {
      loader = Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth ?? 4,
            ),
          ),
          Text(
            (value! * 100).toString(),
            style: const TextStyle(fontSize: 12),
          ),
        ],
      );
    } else if (shape == AppLoaderShape.circular && value == null) {
      loader = SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          value: value,
          backgroundColor: backgroundColor,
          color: color,
        ),
      );
    } else {
      loader = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(
            value: value,
            backgroundColor: backgroundColor,
            color: color,
            minHeight: size,
          ),
          const SizedBox(height: 10),
          Text(
            (value! * 100).toString(),
            style: const TextStyle(fontSize: 14),
          ),
        ],
      );
    }

    if (isCentrized ?? false) {
      return Center(child: loader);
    }

    return loader;
  }
}
