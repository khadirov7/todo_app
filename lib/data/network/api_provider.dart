import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/data/models/product_model.dart';
import 'package:todo_app/utils/constants/app_constants.dart';
import '../models/my_response.dart';

class ApiProvider {
  static Future<MyResponse> getAllProducts() async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/products");
    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return MyResponse(
          data: (jsonDecode(response.body)["items"] as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> addProduct(ProductModel productModel) async {
    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/api/v1/products",
    );
    try {
      http.Response response = await http.post(
          uri,
          headers: {
            "Authorization": "Bearer ${AppConstants.token}",
            "Content-Type": "application/json",
          },
          body: jsonEncode([{productModel.toJson()}])
      );
      if (response.statusCode == 201) {
        return MyResponse(
            data: "Product added successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> deletedProduct(String productUUID) async {
    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/api/v1/products",
    );
    try {
      http.Response response = await http.delete(
          uri,
          headers: {
            "Authorization": "Bearer ${AppConstants.token}",
            "Content-Type": "application/json",
          },
          body: jsonEncode([{
            "_uuid" : productUUID,
          }])
      );
      if (response.statusCode == 200) {
        return MyResponse(
            data: "Product deleted successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> updateProduct(ProductModel productModel) async {
    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/api/v1/products",
    );
    try {
      http.Response response = await http.put(
          uri,
          headers: {
            "Authorization": "Bearer ${AppConstants.token}",
            "Content-Type": "application/json",
          },
          body: jsonEncode([{productModel.toJsonForUpdate()}])
      );
      if (response.statusCode == 201) {
        return MyResponse(
            data: "Product update successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

}