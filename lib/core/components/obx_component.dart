import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_dev/core/components/app_loader.dart';

class ObxComponent extends StatelessWidget {
  const ObxComponent({
    required this.child,
    required this.showLoader,
    required this.lisenableValue,
    this.duration,
    this.loader,
    super.key,
  });

  final Duration? duration;
  final bool showLoader;
  final Widget child;
  final Widget? loader;
  final dynamic lisenableValue;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        lisenableValue;
        return AnimatedSwitcher(
          duration: duration ?? Durations.extralong4,
          switchInCurve: Curves.fastOutSlowIn,
          child: showLoader ? loader ?? AppLoader.circular() : child,
        );
      },
    );
  }
}
