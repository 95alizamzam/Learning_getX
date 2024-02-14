import 'package:getx_dev/core/network/api_response_model.dart';
import 'package:getx_dev/features/products/data/models/product_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/base_products_repo.dart';
import '../sources/remote.dart';

@LazySingleton(as: BaseProductsRepository)
class ProductsRepoImpl implements BaseProductsRepository {
  final ProductsRemoteSource _remote;
  ProductsRepoImpl(this._remote);

  @override
  Future<ResponseModel<ProductModel>> getSingleProduct({required int id}) =>
      _remote.getSingleProduct(id: id);
}
