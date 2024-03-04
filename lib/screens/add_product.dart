import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/models/product_model.dart';
import '../data/repositories/product_repo.dart';
import '../utils/colors/app_colors.dart';
import '../utils/styles/app_text_style.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key,});


  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final ProductRepo productRepo = ProductRepo();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productImageUrlController = TextEditingController();
  String productName = "";
  String productPrice = "";
  String imageUrl = "";
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
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
            child: Column(
              children: [
                TextField(
                  controller: productNameController,
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 24,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Product name',
                    hintStyle: AppTextStyle.interRegular.copyWith(
                        color: AppColors.c_0A1034,fontSize:16.sp
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.sp,color: AppColors.c_0A1034),
                        borderRadius: BorderRadius.circular(4.r)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.sp,color: AppColors.c_0A1034),
                        borderRadius: BorderRadius.circular(4.r)
                    ),
                  ),
                  onChanged: (v) {
                    productName = v;
                  },
                ),
                SizedBox(height: 30.h,),
                TextField(
                  controller: productPriceController,
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 24,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Product price',
                    hintStyle: AppTextStyle.interRegular.copyWith(
                        color: AppColors.c_0A1034,fontSize:16.sp
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.sp,color: AppColors.c_0A1034),
                        borderRadius: BorderRadius.circular(4.r)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.sp,color: AppColors.c_0A1034),
                        borderRadius: BorderRadius.circular(4.r)
                    ),
                  ),
                  onChanged: (n) {
                    productPrice = n;
                  },
                ),
                SizedBox(height: 30.h,),
                TextField(
                  controller: productImageUrlController,
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 24,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Product Image Url paste',
                    hintStyle: AppTextStyle.interRegular.copyWith(
                        color: AppColors.c_0A1034,fontSize:16.sp
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.sp,color: AppColors.c_0A1034),
                        borderRadius: BorderRadius.circular(4.r)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.sp,color: AppColors.c_0A1034),
                        borderRadius: BorderRadius.circular(4.r)
                    ),
                  ),
                  onChanged: (v) {
                    imageUrl = v;
                  },
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ProductModel productModel = ProductModel(
            description: "",
            productName: productName,
            imageUrl: imageUrl,
            price: productPrice.length,
            dateTime: DateTime.now(),
            productId: "1",
          );
          await productRepo.addProduct(productModel);
          setState(() {});
          Navigator.pop(context);
        },
        child: const Text("Add"),
      ),
    );
  }
}
// ProductModel productModel = ProductModel(
//   color: Colors.red,
//   description: "Zo'r telefon",
//   productName: "Samsung Galaxy S21",
//   imageUrl:
//   "https://www.cnet.com/a/img/resize/3e495e5ec2d57f5893947cb6497fd9f4cf236c4e/hub/2021/01/20/5ac18449-617c-49ba-83f2-2971cb51078c/215-samsung-galaxy-s21-ultra-back.jpg",
//   price: 1500.0,
//   dateTime: DateTime.now(),
//   productId: "",
// );
//
// await productRepo.addProduct(productModel);
// setState(() {});