import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/helper/extenstion.dart';
import 'package:todo/presentation/widgets/my_divider.dart';

import '../../core/constans/texts.dart';
import '../../core/helper/spacing.dart';
import '../../core/routes/settings.dart';
import '../../core/themes/my_colors.dart';
import '../cubits/login_auth/auth_cubit.dart';

class Signin extends StatelessWidget {
  Signin({super.key});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainBackGround,
      appBar: AppBar(
        backgroundColor: MyColors.mainBackGround,
        leading: IconButton(
          onPressed: () {
            context.pushReplacementNamed(Routers.welcome);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            //faild try again
            Container();
          }
          if (state is AuthLoading) {
            const Center(child: CircularProgressIndicator());
          }
          if (state is AuthSuccess) {
            context.pushReplacementNamed(Routers.home);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    child: Text(
                      Texts.register,
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  verticalSpace(25),
                  const Text(Texts.userNameLoginPage,
                      style: TextStyle(color: Colors.white)),
                  TextField(
                    controller: _emailController,
                  ),
                  verticalSpace(25),
                  const Text(Texts.passwordLoginPage,
                      style: TextStyle(color: Colors.white)),
                  TextField(
                    controller: _passwordController,
                  ),
                  verticalSpace(25),
                  const Text(Texts.confirmPassword,
                      style: TextStyle(color: Colors.white)),
                  TextField(
                    controller: _passwordController,
                  ),
                  verticalSpace(40),
                  Center(
                    child: InkWell(
                        onTap: () {
                          context.read<AuthCubit>().signUP(
                                _emailController.text,
                                _passwordController.text,
                              );
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: MediaQuery.sizeOf(context).height * 0.07,
                          decoration: const BoxDecoration(
                            color: MyColors.purpel,
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              Texts.register,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                  ),
                  verticalSpace(20),
                  const Center(
                    child: SizedBox(child: MyDivider()),
                  ),
                  verticalSpace(25),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.07,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: MyColors.lighterPurpel,
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
                                Texts.registWithGoogle,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(100),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      height: MediaQuery.sizeOf(context).height * 0.07,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              Texts.alreadyHaveAccount,
                              style: TextStyle(color: Colors.grey),
                            ),
                            InkWell(
                              onTap: () {
                                context.pushNamed(Routers.logIn);
                              },
                              child: const InkWell(
                                child: Text(
                                  Texts.loginInLoginPage,
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
          ),
        ),
      ),
    );
  }
}
