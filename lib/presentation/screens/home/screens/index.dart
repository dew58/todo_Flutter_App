import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:todo/core/helper/extenstion.dart';
import '../../../../core/constans/texts.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../../domain/models/todo_model.dart';
import '../../../../main.dart';
import '../../../cubits/add_todo_cubit/add_to_do_cubit.dart';
import '../../../widgets/add_task.dart';
import '../../../widgets/list_of_todo.dart';
import '../../../widgets/no_todo.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  Future<DateTime?>? dateTime;
  bool isTimeSelected = true;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: appUserReady,
      builder: (context, isReady, child) {
        if (isReady) {
          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: SizedBox(
              height: 70,
              width: 70,
              child: FittedBox(
                child: FloatingActionButton(
                  onPressed: () {
                    _showTaskDialog(context);
                  },
                  shape: const CircleBorder(),
                  backgroundColor: MyColors.purpel,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              surfaceTintColor: MyColors.mainBackGround,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundColor: MyColors.mainBackGround,
                    radius: 24,
                    backgroundImage: (appUser.image != null)
                        ? FileImage(File(appUser.image!))
                        : const AssetImage("assets/icons/userx4.png"),
                  ),
                ),
              ],
              elevation: 0,
              leading: CircleAvatar(
                backgroundColor: MyColors.mainBackGround,
                radius: 24,
              ),
              // Image.asset("assets/icons/sort.png"),
              title: const Center(
                child: Text(
                  Texts.home,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              backgroundColor: MyColors.mainBackGround,
            ),
            backgroundColor: MyColors.mainBackGround,
            body: ValueListenableBuilder(
                valueListenable: hiveBoxReady,
                builder: (context, isReady, child) {
                  if (isReady) {
                    return BlocBuilder<AddToDoCubit, AddToDoState>(
                        builder: (context, state) {
                      context.read<AddToDoCubit>().getTodos();
                      print("get todos in the bloc builder");

                      if (state is AddToDoSuccess ||
                          state is AddToDoInitial ||
                          state is AddToDoSuccessAdding) {
                        var todos = context.read<AddToDoCubit>().todos;
                        if (todos.isEmpty) {
                          return const NoTodo();
                        } else {
                          return ListOfTodo(
                            context: context,
                            todos: todos,
                          );
                        }
                      } else {
                        return const NoTodo();
                      }
                    });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  _showTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        isTimeSelected = true;
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        dateTime = showOmniDateTimePicker(
                            context: context, theme: ThemeData.dark());
                      });
                    },
                    child: ImageIcon(
                      const AssetImage("assets/icons/timer.png"),
                      color: isTimeSelected ? Colors.white : Colors.red,
                    ),
                  ),
                  verticalSpace(25),
                  BlocListener<AddToDoCubit, AddToDoState>(
                    listener: (context, state) {
                      if (state is AddToDoSuccessAdding) {
                        context.pop();
                      } else if (state is AddToDoFailer) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error)),
                        );
                      }
                    },
                    child: GestureDetector(
                      onTap: () async {
                        var format = DateFormat('EEE, h:mm a');
                        DateTime? formatedDateTime;
                        formatedDateTime = await dateTime;
                        if (context
                                .read<AddToDoCubit>()
                                .formKey
                                .currentState!
                                .validate() &&
                            dateTime != null) {
                          context
                              .read<AddToDoCubit>()
                              .formKey
                              .currentState!
                              .save();
                          context.read<AddToDoCubit>().addToDo(ToDo(
                              name: context
                                  .read<AddToDoCubit>()
                                  .nameController
                                  .text,
                              description: context
                                  .read<AddToDoCubit>()
                                  .descriptionController
                                  .text,
                              dateTime: format.format(formatedDateTime!)));
                        } else {
                          context.read<AddToDoCubit>().autovalidateMode =
                              AutovalidateMode.always;
                        }

                        context
                            .read<AddToDoCubit>()
                            .descriptionController
                            .clear();
                        context.read<AddToDoCubit>().nameController.clear();
                        setState(() {
                          if (dateTime == null) {
                            isTimeSelected = false;
                          }
                        });
                      },
                      child: ImageIcon(
                        const AssetImage("assets/icons/send.png"),
                        color: MyColors.purpel,
                      ),
                    ),
                  ),
                ],
              )
            ],
            content: const AddTask(),
            backgroundColor: MyColors.liteGray,
            title: Text(
              Texts.addTask,
              style: TextStyle(color: Colors.white, fontSize: 25.sp),
            ),
          );
        });
      },
    );
  }
}
