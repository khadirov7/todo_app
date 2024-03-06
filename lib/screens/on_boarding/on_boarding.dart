import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors/app_colors.dart';

import '../../data/task/page_data_model.dart';
import '../../utils/images/app_images.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int activeIndex = 0;
  final PageController pageController = PageController();

  List<PageDataModel> pagesData = [
    PageDataModel(
      iconPath: AppImages.onSplash,
      title: "Manage your tasks",
      subtitle:
      "You can easily manage all of your daily tasks in DoMe for free",
    ),
    PageDataModel(
      iconPath: AppImages.picture2,
      title: "Create daily routine",
      subtitle:
      "In Uptodo  you can create your personalized routine to stay productive",
    ),
    PageDataModel(
        iconPath: AppImages.picture3,
        title: "Orgonaize your tasks",
        subtitle:"You can organize your daily tasks by adding your tasks into separate categories")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0C0F14,
      body: Column(
        children: [
          )
        ],
      ),
    );
  }
}
