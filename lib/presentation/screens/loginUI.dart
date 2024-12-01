import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/loginAuth/cubit/auth_cubit.dart';
import 'package:todo/presentation/cubits/add_todo_cubit/add_to_do_cubit.dart';
import 'package:todo/presentation/screens/signIN.dart';
import 'package:todo/presentation/screens/home/mainHome.dart';

class Loginui extends StatefulWidget {
  const Loginui({super.key});

  @override
  State<Loginui> createState() => _LoginuiState();
}

class _LoginuiState extends State<Loginui> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Auth_Cubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: Auth_Cubit,
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AuthSuccess) {
          BlocProvider(
            create: (context) => AddToDoCubit(),
            child: HomePage(),
          );
        } else if (state is AuthError) {}
        return Scaffold(
          backgroundColor: const Color(0XFF121212),
          appBar: AppBar(
            backgroundColor: const Color(0XFF121212),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
            ),
          ),
          body: Container(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.08,
                ),
                const Text("Username", style: TextStyle(color: Colors.white)),
                TextField(
                  controller: _emailController,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),
                const Text('Password', style: TextStyle(color: Colors.white)),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.09,
                ),
                Center(
                  child: InkWell(
                      onTap: () {
                        Auth_Cubit.logIn(
                            _emailController.text, _passwordController.text);
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.07,
                        decoration: const BoxDecoration(
                          color: Color(0xff8687E7),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),
                Center(
                  child: Container(
                    child: const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                            endIndent: 10,
                            indent: 40,
                          ),
                        ),
                        Text("or", style: TextStyle(color: Colors.white)),
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                            endIndent: 40,
                            indent: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      // context.read<AuthBloc>().add(
                      //       GoogleSignInRequested(),
                      //     );
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      height: MediaQuery.sizeOf(context).height * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff8875FF),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/auth/google.png"),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Login with Google",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.08,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: MediaQuery.sizeOf(context).height * 0.07,
                    child: Center(
                      child: Row(
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          InkWell(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Signin()),
                                );
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
