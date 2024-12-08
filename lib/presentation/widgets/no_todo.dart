import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/helper/spacing.dart';

import '../../core/constans/texts.dart';

class NoTodo extends StatelessWidget {
  const NoTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(100),
                Image.asset("assets/auth/homeimage.png"),
                verticalSpace(20),
                Text(
                  Texts.noTaskText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(20),
                Text(
                  Texts.noTaskText2,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(200),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
