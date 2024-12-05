import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/themes/my_colors.dart';
import '../cubits/add_todo_cubit/add_to_do_cubit.dart';

class ListOfTodo extends StatelessWidget {
  const ListOfTodo({super.key});

  @override
  Widget build(BuildContext context) {
    var todos = context.read<AddToDoCubit>().todos;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                height: 72,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    color: MyColors.liteGray),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            todos[index].delete();
                            context.read<AddToDoCubit>().getTodos();
                          },
                          icon: const Icon(Icons.circle)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todos[index].name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            todos[index].dateTime,
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
