import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../data/models/product_model.dart';
import '../data/repositories/product_repo.dart';
import '../utils/colors/app_colors.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo(
      {super.key,
      required this.productId,
      required this.productName,
      required this.description,
      required this.price,
      required this.iconPath});

  final String productName;
  final String description;
  final num price;
  final String iconPath;
  final String productId;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  final ProductRepo productRepo = ProductRepo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.c_0A1034,
            )),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.network(
                      widget.iconPath,
                      width: 221,
                      height: 380,
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ZoomTapAnimation(
                            // onTap: () async {
                            //   showModalBottomSheet(
                            //       isScrollControlled: true,
                            //       context: context,
                            //       shape: const RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.only(
                            //           topRight: Radius.circular(16),
                            //           topLeft: Radius.circular(16),
                            //         ),
                            //       ),
                            //       builder: (BuildContext context) {
                            //         return StatefulBuilder(
                            //             builder: (context, setState) {
                            //           return Padding(
                            //             padding: EdgeInsets.only(
                            //                 bottom: MediaQuery.of(context)
                            //                     .viewInsets
                            //                     .bottom),
                            //             child: Container(
                            //               padding: const EdgeInsets.all(24),
                            //               child: Column(
                            //                 mainAxisSize: MainAxisSize.min,
                            //                 children: [
                            //               ProductModel productModel = ProductModel(
                            //               color: Colors.red,
                            //                 description: product.description,
                            //                 productName: "Macbook Pro M2",
                            //                 imageUrl: product.imageUrl,
                            //                 price: product.price,
                            //                 dateTime: DateTime.now(),
                            //                 productId: product.productId,
                            //               );
                            //
                            //                 await productRepo.updateProduct(productModel);
                            //               setState(() {});
                            //                 await productRepo.updateProduct(productModel);
                            //               setState(() {});
                            //                 ],
                            //               ),
                            //             ),
                            //           );
                            //         });
                            //       });
                            // },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border:
                                    Border.all(width: 1, color: Colors.green),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.mode_edit_outline_outlined,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      "Edit",
                                      style: TextStyle(
                                        color: AppColors.c_0A1034,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        ZoomTapAnimation(
                            onTap: () async {
                              await productRepo.deleteProduct(widget.productId);
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(width: 1, color: Colors.red),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      "Delete",
                                      style: TextStyle(
                                        color: AppColors.c_0A1034,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
                Text(
                  widget.description,
                  style: TextStyle(
                    color: AppColors.c_0A1034,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
