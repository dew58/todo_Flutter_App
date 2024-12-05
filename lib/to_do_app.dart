import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes/app_router.dart';
import 'core/routes/settings.dart';
import 'core/themes/my_colors.dart';

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({
    super.key,
    required this.appRouter,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRoute = '';
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    determineInitialRoute();
  }

  void determineInitialRoute() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        if (user == null) {
          initialRoute = Routers.logIn;
        } else {
          initialRoute = Routers.home;
        }
        isInitialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'ToDo List',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            canvasColor: MyColors.liteGray,
            fontFamily: "Lato"),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: widget.appRouter.generateRoute,
        initialRoute: initialRoute,
      ),
    );
  }
}
