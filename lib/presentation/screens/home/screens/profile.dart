import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/helper/extenstion.dart';
import 'package:todo/core/helper/spacing.dart';
import 'package:todo/main.dart';

import '../../../../core/constans/texts.dart';
import '../../../../core/routes/settings.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../../domain/repositories/todo_usre_repo.dart';
import '../../../cubits/login_auth/auth_cubit.dart';
import '../../../widgets/profile_item.dart';
import '../../../widgets/profile_widgets/alert_dialog_edit_image.dart';
import '../../../widgets/profile_widgets/alert_dialog_edit_name.dart';
// import '../../../widgets/profile_widgets/alert_dialog_edit_password.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    int numberOfDoneTasks = TodoUsreRepo.getDoneTasks();
    int numberOfLeftTasks = TodoUsreRepo.getLeftTasks();

    return Scaffold(
      backgroundColor: MyColors.mainBackGround,
      appBar: AppBar(
        surfaceTintColor: MyColors.mainBackGround,
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
      body: ValueListenableBuilder(
          valueListenable: appUserReady,
          builder: (context, isReady, child) {
            if (isReady) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Column(children: [
                          CircleAvatar(
                              backgroundColor: MyColors.mainBackGround,
                              radius: 40,
                              backgroundImage: (appUser.image != null)
                                  ? (appUser.image!.startsWith('http')
                                      ? NetworkImage(appUser.image!)
                                      : FileImage(File(appUser.image!)))
                                  : const AssetImage(
                                      "assets/icons/userx4.png")),
                          Text(
                            appUser.name ?? " ",
                            style: const TextStyle(color: Colors.white),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.07,
                                  decoration: BoxDecoration(
                                    color: MyColors.liteGray,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "$numberOfLeftTasks Task left",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.07,
                                  decoration: BoxDecoration(
                                    color: MyColors.liteGray,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "$numberOfDoneTasks Task done",
                                      style:
                                          const TextStyle(color: Colors.white),
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
                                  "assets/icons/setting-2.png", "App Settings",
                                  () {
                                context.pushNamed(Routers.setting);
                              }),
                              verticalSpace(15),
                              Padding(
                                padding: EdgeInsets.only(left: 20.w),
                                child: const Text(
                                  Texts.account,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ProfileItem().profileItem("assets/icons/user.png",
                                  "Change account name", () {
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AlertDialogEditName();
                                      });
                                  setState(() {});
                                });
                              }),
                              // ProfileItem().profileItem("assets/icons/key.png",
                              //     "Change account password", () {
                              //   setState(() {
                              //     showDialog(
                              //         context: context,
                              //         builder: (context) {
                              //           return const AlertDialogEditPassword();
                              //         });
                              //   });
                              // }),
                              ProfileItem().profileItem(
                                  "assets/icons/camera.png",
                                  "Change account image", () {
                                setState(() {
                                  showBottomDialogImage(context);
                                });
                              }),
                              verticalSpace(10),
                              Padding(
                                padding: EdgeInsets.only(left: 20.w),
                                child: const Text(
                                  Texts.upTodo,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ProfileItem().profileItem(
                                  "assets/icons/menu.png", "About US", () {
                                context.pushNamed(Routers.aboutUs);
                              }),
                              ProfileItem().profileItem(
                                  "assets/icons/info-circle.png", "FAQ", () {
                                context.pushNamed(Routers.faq);
                              }),
                              ProfileItem().profileItem(
                                  "assets/icons/flash.png", "Help & Feedback",
                                  () {
                                context.pushNamed(Routers.helpAndFeedback);
                              }),
                              ProfileItem().profileItem(
                                  "assets/icons/like.png", "Support US", () {
                                context.pushNamed(Routers.support);
                              }),
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
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
