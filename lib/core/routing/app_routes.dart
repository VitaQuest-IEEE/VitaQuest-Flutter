import 'package:flutter/material.dart';
import 'package:vita_quest/features/auth_feature/presentation/screens/login_screen.dart';
import 'package:vita_quest/features/auth_feature/presentation/screens/signup_screen.dart';
import 'package:vita_quest/features/introduction/presentation/screens/on_boarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/introduction/presentation/presentation_logic_holder/on_boarding_cubit.dart';
import '../../features/introduction/presentation/screens/splash_screen.dart';
import 'routes.dart';

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({required super.builder});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 750);
}

class AppRoutes {
  //* Generates a route based on the route name.
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<OnBoardingCubit>(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingScreen(),
          ),
        );
    }
    return null;
  }
}
