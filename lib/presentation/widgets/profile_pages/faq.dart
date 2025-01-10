import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/helper/extenstion.dart';
import 'package:todo/core/helper/spacing.dart';

import '../../../core/constans/faqtext.dart';
import '../../../core/themes/my_colors.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainBackGround,
      appBar: AppBar(
        actions: [SizedBox(width: 50.w)],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        surfaceTintColor: MyColors.mainBackGround,
        elevation: 0,
        backgroundColor: MyColors.mainBackGround,
        title: const Center(
          child: Text(
            "FQA",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Frequently Asked Questions',
                  style: TextStyle(color: MyColors.purpel, fontSize: 20.sp),
                ),
                verticalSpace(20),
                Text(
                  FAQTexts.q1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                verticalSpace(5),
                Text(
                  FAQTexts.a1,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                verticalSpace(20),
                Text(
                  FAQTexts.q2,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                verticalSpace(5),
                Text(
                  FAQTexts.a2,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                verticalSpace(20),
                Text(
                  FAQTexts.q3,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                verticalSpace(5),
                Text(
                  FAQTexts.a3,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                verticalSpace(20),
                Text(
                  FAQTexts.q4,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                verticalSpace(5),
                Text(
                  FAQTexts.a4,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                verticalSpace(20),
                Text(
                  FAQTexts.q5,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                verticalSpace(5),
                Text(
                  FAQTexts.a5,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                verticalSpace(20),
                Text(
                  FAQTexts.q6,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                verticalSpace(5),
                Text(
                  FAQTexts.a6,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                verticalSpace(20),
                Text(
                  FAQTexts.q7,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                verticalSpace(5),
                Text(
                  FAQTexts.a7,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                // Add more Text widgets as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
