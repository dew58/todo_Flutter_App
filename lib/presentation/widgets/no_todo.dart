import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/helper/spacing.dart';

import '../../core/constans/texts.dart';

class NoTodo extends StatelessWidget {
  const NoTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/auth/homeimage.png"),
          verticalSpace(20),
          Text(
            Texts.noTaskText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
          verticalSpace(20),
          Text(Texts.noTaskText2,
              style: TextStyle(color: Colors.white, fontSize: 15.sp)),
          verticalSpace(200),
        ],
      ),
    );
  }
}
