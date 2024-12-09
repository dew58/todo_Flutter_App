import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/domain/models/todo_model.dart';
import 'package:todo/presentation/cubits/add_todo_cubit/add_to_do_cubit.dart';
import 'package:todo/to_do_app.dart';
import 'core/routes/app_router.dart';
import 'firebase_options.dart';

late String initialRoute;
Box<ToDo>? box;
final ValueNotifier<bool> hiveBoxReady = ValueNotifier(false);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      debugPrint("open a box myTodo$uId");
    }
  });

  runApp(BlocProvider(
    create: (context) => AddToDoCubit(),
    child: MyApp(
      appRouter: AppRouter(),
    ),
  ));
}
