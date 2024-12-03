import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/constans/settings.dart';
import 'package:todo/domain/loginAuth/cubit/auth_cubit.dart';
import 'package:todo/presentation/cubits/add_todo_cubit/add_to_do_cubit.dart';
import 'package:todo/presentation/screens/home/mainHome.dart';
import 'package:todo/presentation/screens/loginUI.dart';
import 'package:todo/presentation/screens/onbording_ui.dart';
import 'package:todo/presentation/screens/signIN.dart';
import 'package:todo/presentation/screens/welcomeUI.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case logIn:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>.value(
            value: BlocProvider.of<AuthCubit>(_),
            child: const Loginui(),
          ),
        );

      case singUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>.value(
            value: BlocProvider.of<AuthCubit>(_),
            child: const Signin(),
          ),
        );

      case welcome:
        return MaterialPageRoute(builder: (_) => const Welcomeui());

      case onBorder:
        return MaterialPageRoute(builder: (_) => const OnbordingUi());
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}
