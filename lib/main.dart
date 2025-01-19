import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/domain/models/todo_model.dart';
import 'package:todo/domain/models/user.dart';
import 'package:todo/presentation/cubits/add_todo_cubit/add_to_do_cubit.dart';
import 'package:todo/to_do_app.dart';
import 'core/notifications/notification_service.dart';
import 'core/notifications/work_service.dart';
import 'core/routes/app_router.dart';
import 'firebase_options.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'dart:developer';

late String initialRoute;
Box<ToDo>? box;
final ValueNotifier<bool> hiveBoxReady = ValueNotifier(false);

ToDoUser appUser = ToDoUser();
final ValueNotifier<bool> appUserReady = ValueNotifier(false);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeTimeZones();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoAdapter());

  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user == null) {
    } else {
      var uId = FirebaseAuth.instance.currentUser!.uid;
      box = await Hive.openBox('myTodo$uId');
      hiveBoxReady.value = true;

      appUser.email = FirebaseAuth.instance.currentUser!.email;
      appUser.name = FirebaseAuth.instance.currentUser!.displayName;
      appUser.image = FirebaseAuth.instance.currentUser!.photoURL;
      appUser.id = FirebaseAuth.instance.currentUser!.uid;
      appUserReady.value = true;
    }
  });

  await LocalNotificationService.init();
  await WorkManagerService().init();

  runApp(
    BlocProvider(
      create: (context) => AddToDoCubit(),
      child: MyApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}

Future<void> initializeTimeZones() async {
  tz.initializeTimeZones();
  final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(currentTimeZone));
  log('Time zone initialized to: ${tz.local.name}');
}
