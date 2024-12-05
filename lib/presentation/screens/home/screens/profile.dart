import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/helper/spacing.dart';

import '../../../../core/constans/texts.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../cubits/login_auth/auth_cubit.dart';
import '../../../widgets/profile_item.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainBackGround,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.mainBackGround,
        title: const Center(
          child: Text(
            Texts.profile,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(children: [
                  const CircleAvatar(
                    radius: 35,
                  ),
                  const Text(
                    "Martha Hays",
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: MediaQuery.sizeOf(context).height * 0.07,
                          decoration: const BoxDecoration(
                            color: MyColors.liteGray,
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "10 Task left",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: MediaQuery.sizeOf(context).height * 0.07,
                          decoration: const BoxDecoration(
                            color: MyColors.liteGray,
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "10 Task done",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
                ]),
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(15),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: const Text(
                          Texts.settings,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ProfileItem().profileItem(
                          "assets/icons/setting-2.png", "App Settings", () {}),
                      verticalSpace(15),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: const Text(
                          Texts.account,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ProfileItem().profileItem("assets/icons/user.png",
                          "Change account name", () {}),
                      ProfileItem().profileItem("assets/icons/key.png",
                          "Change account password", () {}),
                      ProfileItem().profileItem("assets/icons/camera.png",
                          "Change account image", () {}),
                      verticalSpace(10),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: const Text(
                          Texts.upTodo,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ProfileItem().profileItem(
                          "assets/icons/menu.png", "About US", () {}),
                      ProfileItem().profileItem(
                          "assets/icons/info-circle.png", "FAQ", () {}),
                      ProfileItem().profileItem(
                          "assets/icons/flash.png", "Help & Feedback", () {}),
                      ProfileItem().profileItem(
                          "assets/icons/like.png", "Support US", () {}),
                      ProfileItem().profileItem(
                          "assets/icons/logout.png", "Log out", () {
                        context.read<AuthCubit>().logOut(context);
                      }),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
