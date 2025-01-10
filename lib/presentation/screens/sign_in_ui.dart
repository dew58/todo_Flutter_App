import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainBackGround,
      appBar: AppBar(
        surfaceTintColor: MyColors.mainBackGround,
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        Texts.register,
                        style: TextStyle(color: Colors.white, fontSize: 40.sp),
                      ),
                    ),
                  ),
                  verticalSpace(25),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(Texts.userNameLoginPage,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  verticalSpace(10),
                  SizedBox(
                    width: 327.w,
                    height: 50.h,
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Enter Your email",
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.7, color: Colors.white),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.7, color: Colors.white),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.7, color: Colors.red),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.7, color: Colors.red),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  verticalSpace(25),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(Texts.passwordLoginPage,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  verticalSpace(10),
                  SizedBox(
                    width: 327.w,
                    height: 50.h,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Your password",
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.7, color: Colors.white),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.7, color: Colors.white),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.7, color: Colors.red),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.7, color: Colors.red),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  verticalSpace(25),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(Texts.confirmPassword,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  verticalSpace(10),
                  SizedBox(
                    width: 327.w,
                    height: 50.h,
                    child: TextField(
                      obscureText: true,
                      controller: _confirmpasswordController,
                      decoration: InputDecoration(
                        hintText: "Confirm your password",
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.7, color: Colors.white),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.7, color: Colors.white),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.7, color: Colors.red),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.7, color: Colors.red),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  verticalSpace(40),
                  Center(
                    child: GestureDetector(
                        onTap: () {
                          context.read<AuthCubit>().signUP(
                                _emailController.text,
                                _passwordController.text,
                              );
                        },
                        child: Container(
                          width: 327.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: MyColors.purpel,
                            borderRadius: const BorderRadius.all(
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
                    child: GestureDetector(
                      onTap: () {
                        context.read<AuthCubit>().signInWithGoogle();
                      },
                      child: Container(
                        width: 327.w,
                        height: 50.h,
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
                  verticalSpace(90),
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
                            GestureDetector(
                              onTap: () {
                                context.pushNamed(Routers.logIn);
                              },
                              child: GestureDetector(
                                child: const Text(
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
