import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/constans/my_colors.dart';
import 'package:todo/domain/models/todo_model.dart';
import 'package:todo/presentation/cubits/add_todo_cubit/add_to_do_cubit.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AddToDoCubit>().getTodos;
    return Scaffold(
      appBar: AppBar(
          actions: const [Icon(Icons.verified_user)],
          elevation: 0,
          leading: Image.asset("assets/icons/sort.png"),
          title: const Center(
            child: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      body: BlocBuilder<AddToDoCubit, AddToDoState>(builder: (context, state) {
        if (state is AddToDoSuccessGetting) {
          final todos = state.todos;
          if (todos.isEmpty) {
            return noTodos(context);
          } else {
            return listOfToDo(todos, context);
          }
        } else if (state is AddToDoFailer) {
          return noTodos(context);
        }
        return noTodos(context);
      }),
    );
  }

  Widget noTodos(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/auth/homeimage.png"),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "What do you want to do today?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Tap + to add your tasks",
              style: TextStyle(color: Colors.white, fontSize: 15)),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
          )
        ],
      ),
    );
  }

  Widget listOfToDo(List<ToDo> todos, BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                  color: MyColors.liteGray),
              child: Column(
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
            );
          }),
    );
  }
}
