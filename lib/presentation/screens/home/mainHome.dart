import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:todo/constans/my_colors.dart';
import 'package:todo/domain/models/todo_model.dart';
import 'package:todo/presentation/cubits/add_todo_cubit/add_to_do_cubit.dart';
import 'package:todo/presentation/screens/home/screens/calendar.dart';
import 'package:todo/presentation/screens/home/screens/focues.dart';
import 'package:todo/presentation/screens/home/screens/index.dart';
import 'package:todo/presentation/screens/home/screens/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of widgets that represent different screens
  static final _screens = [
    BlocBuilder<AddToDoCubit, AddToDoState>(
      builder: (context, state) {
        return const Index();
      },
    ),
    const Calender(),
    const Focues(),
    const Profile()
  ];

  // Function to handle index change when tapping on an icon

  final PageController _myPage = PageController(initialPage: 0);

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? description;
  String? name;
  late Future<DateTime?> dateTime;
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myPage.addListener(() {
      if (_myPage.page!.round() != currentIndex) {
        setState(() {
          currentIndex = _myPage.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _myPage.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocProvider(
        create: (context) => AddToDoCubit(),
        child: SizedBox(
          height: 70,
          width: 70,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                _showTaskDialog();
              },
              shape: const CircleBorder(),
              backgroundColor: MyColors.purpel,
              child: const Icon(Icons.add, color: Colors.white),
            ),
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
      backgroundColor: Colors.black,
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
    return InkWell(
      onTap: () {
        setState(() {
          _myPage.jumpToPage(page);

          // print(_myPage.page);
        });
      },
      child: Column(
        children: [
          (currentIndex == page)
              ? Image.asset("assets/icons/${icon}selected.png")
              : Image.asset("assets/icons/${icon}.png"),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          )
        ],
      ),
    );
  }

  _showTaskDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          Widget? addTask = Container(
            height: MediaQuery.sizeOf(context).height * 0.25,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Form(
              key: _formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Task Name",
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
                    onSaved: (value) {
                      name = value;
                    },
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter the Name of the task";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Description",
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
                    onSaved: (value) {
                      description = value;
                    },
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter the Description of the task";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          );
          return BlocListener<AddToDoCubit, AddToDoState>(
            listener: (context, state) {
              if (state is AddToDoSuccessAdding) {
                // Handle success (e.g., close the dialog or show a message)
                Navigator.of(context).pop();
                context.read<AddToDoCubit>().getTodos(); // Close the dialog
              } else if (state is AddToDoFailer) {
                // Handle failure (e.g., show an error message)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            child: AlertDialog(
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          dateTime = showOmniDateTimePicker(
                              context: context, theme: ThemeData.dark());
                        });
                      },
                      child: const ImageIcon(
                        AssetImage("assets/icons/timer.png"),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context.read<AddToDoCubit>().addToDo(ToDo(
                              name: name!,
                              description: description!,
                              dateTime: dateTime.toString()));
                          setState(() {});
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                      },
                      child: const ImageIcon(
                        AssetImage("assets/icons/send.png"),
                        color: MyColors.purpel,
                      ),
                    ),
                  ],
                )
              ],
              content: addTask,
              backgroundColor: MyColors.liteGray,
              title: const Text(
                "Add Task",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          );
        });
  }
}
