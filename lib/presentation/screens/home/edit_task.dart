// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/helper/extenstion.dart';
import 'package:todo/core/helper/spacing.dart';
import 'package:todo/domain/models/todo_model.dart';
import 'package:todo/presentation/cubits/add_todo_cubit/add_to_do_cubit.dart';

import '../../../core/themes/my_colors.dart';
import '../../widgets/edit_task_widgets/delete_task.dart';
import '../../widgets/edit_task_widgets/display_task.dart';
import '../../widgets/edit_task_widgets/edit_task_button.dart';
import '../../widgets/edit_task_widgets/task_time.dart';

// ignore: must_be_immutable
class EditTask extends StatelessWidget {
  int index;
  EditTask({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainBackGround,
      appBar: AppBar(
        surfaceTintColor: MyColors.mainBackGround,
        backgroundColor: MyColors.mainBackGround,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w, top: 10.h),
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Image.asset("assets/icons/Close.png"),
          ),
        ),
      ),
      body: BlocBuilder<AddToDoCubit, AddToDoState>(
        builder: (context, state) {
          ToDo todo = context.read<AddToDoCubit>().todos[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            child: Column(
              children: [
                DisplayTask(
                  name: todo.name,
                  description: todo.description,
                ),
                verticalSpace(40.h),
                TaskTime(
                  index: index,
                ),
                verticalSpace(30.h),
                DeleteTask(index: index),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: EditTaskButton(index: index),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
