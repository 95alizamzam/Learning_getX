import 'package:flutter/material.dart';
import 'package:getx_dev/core/di/di_setup.dart';

import 'core/getx/base_getx_controller.dart';
import 'features/products/presentations/pages/product_details.dart';

/// this project specific to learn GetX State-management by practice
void main() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      home: const Scaffold(
        body: ProductDetailsPage(),
      ),
    );
  }
}
