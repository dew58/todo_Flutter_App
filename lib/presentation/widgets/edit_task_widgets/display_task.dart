// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo/core/helper/spacing.dart';

import '../../../core/themes/my_colors.dart';

// ignore: must_be_immutable
class DisplayTask extends StatelessWidget {
  String name;
  String description;
  DisplayTask({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 20.h,
              width: 20.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.r),
                  border: Border.all(color: Colors.white, width: 1)),
              child: CircleAvatar(
                backgroundColor: MyColors.liteGray,
                radius: 5.r,
              ),
            ),
            horizontalSpace(15),
            Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
            const Spacer(),
            GestureDetector(
              child: Image.asset("assets/icons/edit.png"),
            )
          ],
        ),
        verticalSpace(15),
        Padding(
          padding: EdgeInsets.only(left: 35.w),
          child: Text(
            description,
            style: TextStyle(color: Colors.grey, fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
