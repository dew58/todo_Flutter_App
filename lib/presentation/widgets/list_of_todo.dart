// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/themes/my_colors.dart';
import '../../domain/models/todo_model.dart';
import '../cubits/add_todo_cubit/add_to_do_cubit.dart';
import '../screens/home/edit_task.dart';

// ignore: must_be_immutable
class ListOfTodo extends StatelessWidget {
  BuildContext context;
  List<ToDo> todos;
  ListOfTodo({
    super.key,
    required this.context,
    required this.todos,
  });

  @override
  Widget build(context) {
    return BlocBuilder<AddToDoCubit, AddToDoState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditTask(
                                  index: index,
                                )),
                      );
                    },
                    child: Container(
                      height: 72.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: MyColors.liteGray),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 10.h),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  todos[index].delete();
                                  context.read<AddToDoCubit>().getTodos();
                                },
                                icon: const Icon(Icons.circle)),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.68,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    todos[index].name,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: true,
                                  ),
                                  Text(
                                    todos[index].dateTime,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11.sp),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
