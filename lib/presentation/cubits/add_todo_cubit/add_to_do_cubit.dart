import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/domain/models/todo_model.dart';

part 'add_to_do_state.dart';

class AddToDoCubit extends Cubit<AddToDoState> {
  AddToDoCubit() : super(AddToDoInitial());

  addToDo(ToDo todo) async {
    emit(AddToDoLoading());
    try {
      var box = Hive.box<ToDo>("myTodo");
      await box.add(todo);
      emit(AddToDoSuccessAdding());
      getTodos();
    } catch (e) {
      emit(AddToDoFailer(error: e.toString()));
      print(e);
    }
  }

  getTodos() {
    emit(AddToDoLoading());
    try {
      var box = Hive.box<ToDo>("myTodo");
      var todos = box.values.toList();
      emit(AddToDoSuccessGetting(todos: todos));
    } catch (e) {
      emit(AddToDoFailer(error: e.toString()));
      print(e);
    }
  }

  deleteToDo(dynamic key) async {
    emit(AddToDoLoading());
    var box = Hive.box<ToDo>("myTodo");
    await box.delete(key);
  }
}
