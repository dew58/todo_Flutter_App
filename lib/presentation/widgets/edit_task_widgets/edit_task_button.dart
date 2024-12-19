// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/helper/extenstion.dart';

import '../../../core/constans/texts.dart';
import '../../../core/themes/my_colors.dart';
import '../../../domain/models/todo_model.dart';
import '../../cubits/add_todo_cubit/add_to_do_cubit.dart';
import '../add_task.dart';

// ignore: must_be_immutable
class EditTaskButton extends StatelessWidget {
  int index;
  EditTaskButton({
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
                scrollable: true,
                title: Center(
                  child: Text(
                    Texts.editTaskTitel,
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
                  ),
                ),
                content: const AddTask(),
                backgroundColor: MyColors.liteGray,
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
                          style: TextStyle(
                              color: MyColors.purpel, fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      var key = context.read<AddToDoCubit>().todos[index].key;
                      context.read<AddToDoCubit>().editToDo(
                          key,
                          ToDo(
                              name: context
                                  .read<AddToDoCubit>()
                                  .nameController
                                  .text,
                              dateTime: context
                                  .read<AddToDoCubit>()
                                  .todos[index]
                                  .dateTime,
                              description: context
                                  .read<AddToDoCubit>()
                                  .descriptionController
                                  .text));
                      context.read<AddToDoCubit>().getTodos();
                      context.pop();
                      context.read<AddToDoCubit>().nameController.clear();
                      context
                          .read<AddToDoCubit>()
                          .descriptionController
                          .clear();
                    },
                    child: Container(
                      height: 50.h,
                      width: 105.w,
                      decoration: BoxDecoration(
                        color: MyColors.purpel,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          Texts.edit,
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
      child: Container(
        height: 50.h,
        width: 330.w,
        decoration: BoxDecoration(
          color: MyColors.purpel,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Center(
          child: Text(
            Texts.editTask,
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
