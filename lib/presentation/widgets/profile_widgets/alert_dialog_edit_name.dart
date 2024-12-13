import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:todo/core/helper/extenstion.dart";
import "package:todo/presentation/cubits/add_todo_cubit/add_to_do_cubit.dart";

import "../../../core/constans/texts.dart";
import "../../../core/themes/my_colors.dart";
import "../../../domain/repositories/todo_usre_repo.dart";

class AlertDialogEditName extends StatelessWidget {
  const AlertDialogEditName({super.key});

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
      content: TextField(
        controller: context.read<AddToDoCubit>().editNameController,
        decoration: InputDecoration(
          hintText: Texts.editNameTextHint,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.7, color: MyColors.liteGray),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.7, color: Colors.white),
            borderRadius: BorderRadius.circular(4),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.7, color: Colors.red),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.7, color: Colors.red),
            borderRadius: BorderRadius.circular(4),
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
            width: 105.w,
            child: Center(
              child: Text(
                Texts.cancel,
                style: TextStyle(color: MyColors.purpel, fontSize: 16.sp),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            TodoUsreRepo().changeName(
                context.read<AddToDoCubit>().editNameController.text);
            context.pop();
          },
          child: Container(
            height: 50.h,
            width: 105.w,
            decoration: const BoxDecoration(
              color: MyColors.purpel,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Center(
              child: Text(
                Texts.edit,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
