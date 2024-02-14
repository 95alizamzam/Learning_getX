import 'package:getx_dev/core/network/api_response_model.dart';
import 'package:getx_dev/features/products/data/models/product_model.dart';
import 'package:getx_dev/features/products/domain/repository/base_products_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/getx/base_getx_controller.dart';

@injectable
class ProductsController extends BaseGetXController {
  final BaseProductsRepository repository;

  ProductsController(this.repository);

  final String singleProductId = "singleProductId";

  late ProductModel? singleProduct;
  Future<void> getSingleProduct({required int id}) async {
    startLoading();
    update([singleProductId]);
    final result = await repository.getSingleProduct(id: id);
    singleProduct = result.resolve<ProductModel>(this);
    stopLoading();
    update([singleProductId]);
  }
}
