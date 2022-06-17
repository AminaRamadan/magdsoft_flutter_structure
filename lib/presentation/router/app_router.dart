import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/register_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';

class Routes {
  static const String loginRoute = '/';
  static const String registerRoute = '/register';
  static const String userDataRoute = '/user';
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.userDataRoute:
        return MaterialPageRoute(builder: (_) => UserDataScreen());
      default:
        return null;
    }
  }
}