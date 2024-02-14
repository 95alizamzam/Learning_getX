import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_dev/core/components/app_loader.dart';

import '../getx/base_getx_controller.dart';

class GetBuilderComponent<T extends BaseGetXController>
    extends StatelessWidget {
  const GetBuilderComponent({
    required this.buildChild,
    required this.controller,
    required this.id,
    required this.onRetry,
    super.key,
  });

  final T controller;
  final String id;
  final Widget Function() buildChild;
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      id: id,
      init: controller,
      builder: (con) {
        return con.hasError
            ? ElevatedButton(
                onPressed: onRetry,
                child: const Text("Retry"),
              )
            : AnimatedSwitcher(
                duration: Durations.extralong2,
                child: con.isLoading ? AppLoader.circular() : buildChild(),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
      },
    );
  }
}
