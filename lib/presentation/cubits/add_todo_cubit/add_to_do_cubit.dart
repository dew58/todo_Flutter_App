import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/domain/models/todo_model.dart';

part 'add_to_do_state.dart';

class AddToDoCubit extends Cubit<AddToDoState> {
  AddToDoCubit() : super(AddToDoInitial());

  var todos;
  var box = Hive.box<ToDo>("myTodo");

  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  addToDo(ToDo todo) async {
    try {
      emit(AddToDoDummy());
      await box.add(todo);
      emit(AddToDoSuccessAdding());
    } catch (e) {
      emit(AddToDoFailer(error: e.toString()));
    }
  }

  getTodos() {
    try {
      emit(AddToDoDummy());
      todos = box.values.toList();
      emit(AddToDoSuccess());
    } catch (e) {
      emit(AddToDoFailer(error: e.toString()));
    }
  }
}
