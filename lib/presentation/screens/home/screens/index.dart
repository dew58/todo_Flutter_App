import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constans/texts.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../../main.dart';
import '../../../cubits/add_todo_cubit/add_to_do_cubit.dart';
import '../../../widgets/list_of_todo.dart';
import '../../../widgets/no_todo.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: MyColors.mainBackGround,
        actions: const [Icon(Icons.verified_user)],
        elevation: 0,
        leading: Image.asset("assets/icons/sort.png"),
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
  }
}
