import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/models/todo_model.dart';

import '../../../main.dart';

part 'add_to_do_state.dart';

class AddToDoCubit extends Cubit<AddToDoState> {
  AddToDoCubit() : super(AddToDoInitial()) {
    // getTodos();
  }
  List<ToDo> todos = [];
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  addToDo(ToDo todo) {
    try {
      emit(AddToDoDummy());
      box!.add(todo);
      emit(AddToDoSuccessAdding());
      getTodos();
    } catch (e) {
      emit(AddToDoFailer(error: e.toString()));
    }
  }

  getTodos() {
    try {
      emit(AddToDoDummy());
      todos = box!.values.toList();
      emit(AddToDoSuccess());
    } catch (e) {
      emit(AddToDoFailer(error: e.toString()));
    }
  }

  editToDo(int key, ToDo todo) {
    try {
      emit(AddToDoDummy());
      box!.put(key, todo);
      emit(AddToDoSuccess());
    } catch (e) {
      emit(AddToDoFailer(error: e.toString()));
    }
  }
}
