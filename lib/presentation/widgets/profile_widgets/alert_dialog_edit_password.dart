import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constans/texts.dart';
import '../../../core/themes/my_colors.dart';

class AlertDialogEditPassword extends StatelessWidget {
  const AlertDialogEditPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      backgroundColor: MyColors.liteGray,
      title: Center(
        child: Text(
          Texts.editNameDialogTitle,
          style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      content: SizedBox(
        height: 100.h,
        width: 250.w,
      ),
    );
  }
}
