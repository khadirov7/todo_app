import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../data/local/storage_repository.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/size/size_utils.dart';
import '../../utils/styles/app_text_style.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    bool isEnterBefore=StorageRepository.getBool(key:'bool');
    Future.delayed(const Duration(seconds: 10),(){
      if(isEnterBefore) {
        Navigator.pushReplacementNamed(context,RouteNames.homeScreen);
      } else{
        Navigator.pushReplacementNamed(context,RouteNames.onboardingScreen);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.amber[200],
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie/Animation - 1709730485764.json",
            width: 428,
            height: 300,
            fit: BoxFit.fill,),
          SizedBox(height: 35.h,),
          Text('Coffee Shop',style: AppTextStyle.interBold.copyWith(
              color:AppColors.black,fontSize: 40.sp
          ),)
        ],),),
    );
  }
}
