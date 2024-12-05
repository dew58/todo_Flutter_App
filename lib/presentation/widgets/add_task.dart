import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/helper/spacing.dart';
import 'package:todo/presentation/cubits/add_todo_cubit/add_to_do_cubit.dart';

import '../../core/constans/texts.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddToDoCubit, AddToDoState>(
      listener: (context, state) {},
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.25,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Form(
          key: context.read<AddToDoCubit>().formKey,
          autovalidateMode: context.read<AddToDoCubit>().autovalidateMode,
          child: Column(
            children: [
              TextFormField(
                controller: context.read<AddToDoCubit>().nameController,
                decoration: InputDecoration(
                  hintText: Texts.taskName,
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0.7, color: Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0.7, color: Colors.white),
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
                style: const TextStyle(color: Colors.white),
                onSaved: (value) {
                  context.read<AddToDoCubit>().nameController.text != value;
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter the Name of the task";
                  } else {
                    return null;
                  }
                },
              ),
              verticalSpace(15),
              TextFormField(
                controller: context.read<AddToDoCubit>().descriptionController,
                decoration: InputDecoration(
                  hintText: Texts.description,
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0.7, color: Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0.7, color: Colors.white),
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
                style: const TextStyle(color: Colors.white),
                onSaved: (value) {
                  context.read<AddToDoCubit>().descriptionController.text =
                      value!;
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter the Description of the task";
                  } else {
                    return null;
                  }
                },
              ),
              verticalSpace(15),
            ],
          ),
        ),
      ),
    );
  }
}
