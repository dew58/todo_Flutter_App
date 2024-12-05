// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo/domain/models/todo_model.dart';

class User {
  String? id;
  String? name;
  String? email;
  String? image;
  List<ToDo>? todos = [];
  int? doneTasks;

  User({
    this.id,
    this.name,
    this.email,
    this.image,
    this.todos,
    this.doneTasks,
  });
}
