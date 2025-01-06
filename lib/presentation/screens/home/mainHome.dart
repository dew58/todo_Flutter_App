import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/my_colors.dart';
import '../../cubits/login_auth/auth_cubit.dart';
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
    // const Calender(),
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

  @override
  void dispose() {
    _myPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainBackGround,
      bottomNavigationBar: BottomAppBar(
        color: MyColors.liteGray,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _listIcon("Index", "home", true, 0),
            _listIcon("Focuse", "clock", false, 1),
            _listIcon("Profile", "user", false, 2),
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
}
