import 'package:flutter/material.dart';
import 'package:getx_dev/core/components/getx_builder_component.dart';
import 'package:getx_dev/core/di/di_setup.dart';

import '../controller/products_controller.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late ProductsController controller;
  @override
  void initState() {
    super.initState();
    controller = getIt<ProductsController>();
    controller.getSingleProduct(id: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilderComponent(
              id: controller.singleProductId,
              controller: controller,
              onRetry: () {
                controller.getSingleProduct(id: 1);
              },
              buildChild: () {
                return Text(controller.singleProduct!.title!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
