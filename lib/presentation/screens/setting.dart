import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/helper/extenstion.dart';
import 'package:todo/core/helper/spacing.dart';

import '../../core/themes/my_colors.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainBackGround,
      appBar: AppBar(
        surfaceTintColor: MyColors.mainBackGround,
        backgroundColor: MyColors.mainBackGround,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        title: const Center(
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Center(
              child: Text(
                "Settings",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: MyColors.mainBackGround,
            radius: 25.r,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "Settings",
                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Pick a color!'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: MyColors.purpel,
                            onColorChanged: (Color color) =>
                                setState(() => MyColors.purpel = color),
                          ),
                        ),
                      );
                    });
                setState(() {});
              },
              child: Row(
                children: [
                  Image.asset("assets/icons/brush.png"),
                  horizontalSpace(20),
                  Text(
                    "Change app color",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
