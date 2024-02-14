import 'package:getx_dev/core/network/end_points.dart';
import 'package:getx_dev/core/network/http_client.dart';
import 'package:getx_dev/features/products/data/models/product_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response_model.dart';
import '../../../../core/network/base_remote_src.dart';

/// [ProductsRemoteSource] the contract which represents the remote data source for products feature
/// here you can find all methods which intreaction with Products feature
/// liks [getSingleProduct]
abstract class ProductsRemoteSource {
  /// fetch the data for only one single product based on its [id]
  Future<ResponseModel<ProductModel>> getSingleProduct({required int id});
}

@LazySingleton(as: ProductsRemoteSource)
class ProductsRemoteSourceImpl extends BaseRemoteDataSource
    implements ProductsRemoteSource {
  ProductsRemoteSourceImpl(super.dioHttpClass);

  @override
  Future<ResponseModel<ProductModel>> getSingleProduct({
    required int id,
  }) async {
    
    return request(
      endPoint: EndPoints.singleProduct(id),
      method: HttpMethods.get,
      serializer: (json) => ProductModel.fromJson(json),
    );
  }
}
