// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import 'package:todo/core/helper/spacing.dart';
import 'package:todo/presentation/cubits/add_todo_cubit/add_to_do_cubit.dart';

import '../../../core/constans/texts.dart';
import '../../../core/themes/my_colors.dart';
import '../../../domain/models/todo_model.dart';

// ignore: must_be_immutable
class TaskTime extends StatelessWidget {
  int index;
  TaskTime({
    Key? key,
    required this.index,
  }) : super(key: key);

  Future<DateTime?>? dateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Image.asset("assets/icons/timer.png"),
            horizontalSpace(10),
            Text(
              Texts.taskTime,
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () async {
            dateTime = showOmniDateTimePicker(
                context: context, theme: ThemeData.dark());
            var format = DateFormat('EEE, h:mm a');
            DateTime? formatedDateTime;
            formatedDateTime = await dateTime;

            context.read<AddToDoCubit>().getTodos();
            context.read<AddToDoCubit>().editToDo(
                context.read<AddToDoCubit>().todos[index].key,
                ToDo(
                  dateTime: format.format(formatedDateTime!),
                  name: context.read<AddToDoCubit>().todos[index].name,
                  description:
                      context.read<AddToDoCubit>().todos[index].description,
                ));
          },
          child: Container(
            height: 40.h,
            width: 110.w,
            decoration: BoxDecoration(
              color: MyColors.liteGray,
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Center(
              child: Text(
                context.read<AddToDoCubit>().todos[index].dateTime,
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
            ),
          ),
        )
      ],
    );
  }
}
