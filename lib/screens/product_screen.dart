import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/screens/add_product.dart';
import 'package:todo_app/screens/product_info.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../data/models/my_response.dart';
import '../data/models/product_model.dart';
import '../data/repositories/product_repo.dart';
import '../utils/colors/app_colors.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductRepo productRepo = ProductRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Products",
          style: TextStyle(
            color: AppColors.c_0A1034,
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: FutureBuilder<MyResponse>(
        future: productRepo.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.hasData) {
            List<ProductModel> products =
                (snapshot.data as MyResponse).data as List<ProductModel>;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.69,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  ...List.generate(
                    products.length,
                    (index) {
                      var product = products[index];
                      return ZoomTapAnimation(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductInfo(productName: product.productName, description: product.description, price: product.price, iconPath: product.imageUrl,productId: product.productId,)));
                        },
                        child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.c_0A1034,
                                width: 1,
                              ),
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(product.imageUrl),
                                SizedBox(height: 5.h,),
                                Text(product.productName,
                                    style: TextStyle(fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.c_0A1034),),
                                SizedBox(height: 5.h,),
                                Text("\$${product.price}",
                                  style: TextStyle(fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF0001FC)),),
                              ],
                            )),
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
