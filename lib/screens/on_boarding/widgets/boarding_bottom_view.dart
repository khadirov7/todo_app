import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/colors/app_colors.dart';

import '../../../data/task/page_data_model.dart';

class PageItem extends StatelessWidget {
  const PageItem({super.key, required this.pageDataModel, required this.horizontalPadding, required this.pagesData, required this.activeIndex});

  final PageDataModel pageDataModel;
  final double horizontalPadding;
  final List<PageDataModel> pagesData;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(pageDataModel.iconPath,width: 257.w,height: 251.h,),
          SizedBox(height: 50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  pagesData.length,
                      (index) => Container(
                    margin: const EdgeInsets.all(4),
                    width:26.w,
                    height:4.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(56.r),
                      color: index == activeIndex
                          ? AppColors.c_D17842
                          : Colors.white54,
                    ),
                  ))
            ],
          ),
          Text(
            pageDataModel.title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 16.h),
          Text(
              pageDataModel.subtitle,
              maxLines: 3,
              textAlign: TextAlign.center,
              style:Theme.of(context).textTheme.titleMedium
          ),
          SizedBox(height:30.h,)
        ],
      ),
    );
  }
}
