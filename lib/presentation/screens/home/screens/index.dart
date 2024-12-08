import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/widgets/list_of_todo.dart';
import 'package:todo/presentation/widgets/no_todo.dart';
import '../../../../core/constans/texts.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../cubits/add_todo_cubit/add_to_do_cubit.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AddToDoCubit>().getTodos();
    print("get todos in the  build body");

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
      body: BlocBuilder<AddToDoCubit, AddToDoState>(builder: (context, state) {
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
      }),
    );
  }
}
