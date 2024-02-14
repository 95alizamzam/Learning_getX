import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

final navKey = GlobalKey<NavigatorState>();

class BaseGetXController extends GetxController {
  bool isLoading = false;
  bool hasError = false;

  void startLoading() {
    hasError = false;
    isLoading = true;
  }

  void stopLoading() {
    isLoading = false;
  }

  void showSnackBar({
    required String text,
  }) {
    final BuildContext context = navKey.currentState!.context;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(text)),
      );
  }
}
