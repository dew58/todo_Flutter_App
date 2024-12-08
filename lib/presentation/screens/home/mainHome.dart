import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:todo/core/helper/extenstion.dart';
import 'package:todo/core/helper/spacing.dart';
import 'package:todo/presentation/widgets/add_task.dart';

import '../../../core/constans/texts.dart';
import '../../../core/themes/my_colors.dart';
import '../../../domain/models/todo_model.dart';
import '../../cubits/add_todo_cubit/add_to_do_cubit.dart';
import '../../cubits/login_auth/auth_cubit.dart';
import 'screens/calendar.dart';
import 'screens/focues.dart';
import 'screens/index.dart';
import 'screens/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static final _screens = [
    const Index(),
    const Calender(),
    const Focues(),
    BlocProvider(
      create: (context) => AuthCubit(),
      child: const Profile(),
    )
  ];

  final PageController _myPage = PageController(initialPage: 0);
  int currentIndex = 0;

  Future<DateTime?>? dateTime;
  bool isTimeSelected = true;

  @override
  void initState() {
    super.initState();
    _myPage.addListener(() {
      if (_myPage.page!.round() != currentIndex) {
        setState(() {
          currentIndex = _myPage.page!.round();
        });
      }
    });
  }

  // @override
  // void dispose() {
  //   _myPage.dispose();
  //   context.read<AddToDoCubit>().descriptionController.dispose();
  //   context.read<AddToDoCubit>().nameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainBackGround,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              _showTaskDialog(context);
            },
            shape: const CircleBorder(),
            backgroundColor: MyColors.purpel,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: MyColors.liteGray,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _listIcon("Index", "home", true, 0),
            _listIcon("Calendar", "calendar", false, 1),
            const SizedBox(
              width: 20,
            ),
            _listIcon("Focuse", "clock", false, 2),
            _listIcon("Profile", "user", false, 3),
          ],
        ),
      ),
      body: Scrollbar(
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _myPage,
          itemBuilder: (BuildContext context, int index) {
            return _screens[index];
          },
        ),
      ),
    );
  }

  Widget _listIcon(String name, String icon, bool selected, int page) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _myPage.jumpToPage(page);
        });
      },
      child: Column(
        children: [
          (currentIndex == page)
              ? Image.asset("assets/icons/${icon}selected.png")
              : Image.asset("assets/icons/${icon}.png"),
          Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          )
        ],
      ),
    );
  }

  _showTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        isTimeSelected = true;
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        dateTime = showOmniDateTimePicker(
                            context: context, theme: ThemeData.dark());
                      });
                    },
                    child: ImageIcon(
                      const AssetImage("assets/icons/timer.png"),
                      color: isTimeSelected ? Colors.white : Colors.red,
                    ),
                  ),
                  verticalSpace(25),
                  BlocListener<AddToDoCubit, AddToDoState>(
                    listener: (context, state) {
                      if (state is AddToDoSuccessAdding) {
                        context.pop();
                      } else if (state is AddToDoFailer) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error)),
                        );
                      }
                    },
                    child: GestureDetector(
                      onTap: () async {
                        var format = DateFormat('EEE, h:mm a');
                        DateTime? formatedDateTime;
                        formatedDateTime = await dateTime;
                        if (context
                                .read<AddToDoCubit>()
                                .formKey
                                .currentState!
                                .validate() &&
                            dateTime != null) {
                          context
                              .read<AddToDoCubit>()
                              .formKey
                              .currentState!
                              .save();
                          context.read<AddToDoCubit>().addToDo(ToDo(
                              name: context
                                  .read<AddToDoCubit>()
                                  .nameController
                                  .text,
                              description: context
                                  .read<AddToDoCubit>()
                                  .descriptionController
                                  .text,
                              dateTime: format.format(formatedDateTime!)));
                        } else {
                          context.read<AddToDoCubit>().autovalidateMode =
                              AutovalidateMode.always;
                        }

                        context
                            .read<AddToDoCubit>()
                            .descriptionController
                            .clear();
                        context.read<AddToDoCubit>().nameController.clear();
                        setState(() {
                          if (dateTime == null) {
                            isTimeSelected = false;
                          }
                        });
                      },
                      child: const ImageIcon(
                        AssetImage("assets/icons/send.png"),
                        color: MyColors.purpel,
                      ),
                    ),
                  ),
                ],
              )
            ],
            content: const AddTask(),
            backgroundColor: MyColors.liteGray,
            title: Text(
              Texts.addTask,
              style: TextStyle(color: Colors.white, fontSize: 25.sp),
            ),
          );
        });
      },
    );
  }
}
