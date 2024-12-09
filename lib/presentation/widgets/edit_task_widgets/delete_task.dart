// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/helper/extenstion.dart';

import 'package:todo/core/helper/spacing.dart';
import 'package:todo/presentation/cubits/add_todo_cubit/add_to_do_cubit.dart';

import '../../../core/constans/texts.dart';
import '../../../core/themes/my_colors.dart';

// ignore: must_be_immutable
class DeleteTask extends StatelessWidget {
  int index;
  DeleteTask({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                backgroundColor: MyColors.liteGray,
                title: Center(
                  child: Text(
                    Texts.deleteTask,
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
                  ),
                ),
                content: SizedBox(
                  height: 70.h,
                  width: 250.w,
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      Texts.deleteMessage,
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: SizedBox(
                      height: 50.h,
                      width: 120.w,
                      child: Center(
                        child: Text(
                          Texts.cancel,
                          style: TextStyle(
                              color: MyColors.purpel, fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                      context.pop();

                      context.read<AddToDoCubit>().todos[index].delete();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: MyColors.purpel,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      height: 50.h,
                      width: 120.w,
                      child: Center(
                        child: Text(
                          Texts.delete,
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            });
      },
      child: Row(
        children: [
          Image.asset("assets/icons/trash.png"),
          horizontalSpace(15),
          Text(
            Texts.deleteTask,
            style: TextStyle(color: Colors.red, fontSize: 16.sp),
          )
        ],
      ),
    );
  }
}
