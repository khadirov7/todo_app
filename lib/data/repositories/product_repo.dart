import 'package:todo_app/data/models/product_model.dart';
import 'package:todo_app/data/network/api_provider.dart';

import '../models/my_response.dart';

class ProductRepo {
  Future<MyResponse> getAllProducts() => ApiProvider.getAllProducts();
  Future<MyResponse> addProduct(ProductModel productModel) => ApiProvider.addProduct(productModel);
  Future<MyResponse> deleteProduct(String productUUID) => ApiProvider.deletedProduct(productUUID);
  Future<MyResponse> updateProduct(ProductModel productModel) => ApiProvider.updateProduct(productModel);

}
