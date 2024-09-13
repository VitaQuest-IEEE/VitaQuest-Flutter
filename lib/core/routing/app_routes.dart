import 'package:flutter/material.dart';
import '../../features/auth_feature/presentation/screens/login_screen.dart';
import '../../features/auth_feature/presentation/screens/signup_screen.dart';
import '../../features/introduction/presentation/screens/on_boarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/introduction/presentation/presentation_logic_holder/on_boarding_cubit.dart';
import '../../features/introduction/presentation/screens/splash_screen.dart';
import 'routes.dart';

class SlideNavigation extends PageRouteBuilder {
  final Widget page;
  final bool? onReverseOnly;

  SlideNavigation(this.page, {this.onReverseOnly})
      : super(
          pageBuilder: (_, animation, __) => page,
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (_, animation, __, child) {
            return onReverseOnly ?? false
                ? animation.status == AnimationStatus.forward
                    ? child
                    : SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      )
                : SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
          },
        );
}

class AppRoutes {
  //* Generates a route based on the route name.
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return SlideNavigation(const SplashScreen());
      case Routes.loginScreen:
        return SlideNavigation(const LoginScreen(), onReverseOnly: true);
      case Routes.signUpScreen:
        return SlideNavigation(const SignUpScreen(), onReverseOnly: true);
      case Routes.onBoarding:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              BlocProvider<OnBoardingCubit>(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingScreen(),
          ),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
    }
    return null;
  }
}
