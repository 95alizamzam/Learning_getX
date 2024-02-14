import '../../../../core/network/api_response_model.dart';
import '../../data/models/product_model.dart';

abstract class BaseProductsRepository {
  Future<ResponseModel<ProductModel>> getSingleProduct({required int id});
}
