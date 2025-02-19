import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/routes/settings.dart';
import 'package:todo/presentation/widgets/profile_pages/about_us.dart';
import 'package:todo/presentation/widgets/profile_pages/help_and_feedback.dart';
import 'package:todo/presentation/widgets/profile_pages/support_us.dart';

import '../../presentation/cubits/login_auth/auth_cubit.dart';
import '../../presentation/screens/home/mainHome.dart';
import '../../presentation/screens/login_ui.dart';
import '../../presentation/screens/onbording_ui.dart';
import '../../presentation/widgets/profile_pages/faq.dart';
import '../../presentation/widgets/profile_pages/setting.dart';
import '../../presentation/screens/sign_in_ui.dart';
import '../../presentation/screens/welcome_ui.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    switch (settings.name) {
      case Routers.logIn:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: Loginui(),
          ),
        );

      case Routers.singUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: Signin(),
          ),
        );

      case Routers.welcome:
        return MaterialPageRoute(builder: (_) => const Welcomeui());

      case Routers.onBorder:
        return MaterialPageRoute(builder: (_) => const OnbordingUi());
      case Routers.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case Routers.setting:
        return MaterialPageRoute(
          builder: (context) => const Setting(),
        );
      case Routers.aboutUs:
        return MaterialPageRoute(
          builder: (context) => const AboutUs(),
        );
      case Routers.helpAndFeedback:
        return MaterialPageRoute(
          builder: (context) => const HelpAndFeedback(),
        );
      case Routers.support:
        return MaterialPageRoute(
          builder: (context) => const SupportUs(),
        );
      case Routers.faq:
        return MaterialPageRoute(
          builder: (context) => const FAQ(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
