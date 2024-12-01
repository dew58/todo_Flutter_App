// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/app_router.dart';
import 'package:todo/constans/my_colors.dart';
import 'package:todo/constans/settings.dart';
import 'package:todo/domain/loginAuth/cubit/auth_cubit.dart';
import 'package:todo/domain/models/todo_model.dart';
import 'package:todo/presentation/cubits/add_todo_cubit/add_to_do_cubit.dart';
import 'firebase_options.dart';

late String initialRoute;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoAdapter());
  await Hive.openBox<ToDo>("myTodo");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      initialRoute = logIn;
    } else {
      initialRoute = home;
    }
  });
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthCubit(firebaseAuth, firebaseAuth),
      ),
      BlocProvider(
        create: (context) => AddToDoCubit(),
      ),
    ],
    child: MyApp(
      appRouter: AppRouter(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  // ignore: use_super_parameters
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      theme:
          ThemeData(primarySwatch: Colors.blue, canvasColor: MyColors.liteGray),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: initialRoute,
    );
  }
}
