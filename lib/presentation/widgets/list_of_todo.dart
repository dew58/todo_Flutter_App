// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/themes/my_colors.dart';
import '../cubits/add_todo_cubit/add_to_do_cubit.dart';

// ignore: must_be_immutable
class ListOfTodo extends StatelessWidget {
  BuildContext context;
  ListOfTodo({
    super.key,
    required this.context,
  });

  @override
  Widget build(context) {
    var todos = context.read<AddToDoCubit>().todos;
    return BlocBuilder<AddToDoCubit, AddToDoState>(
      builder: (context, state) {
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
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
      },
    );
  }
}
