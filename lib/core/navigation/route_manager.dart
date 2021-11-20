import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_care/core/navigation/routes.dart';
import 'package:sleep_care/presentation/screen/authorization/authorization_screen.dart';

Route<T> generateRoute<T>(RouteSettings settings) {
  Route<R> _buildRoute<R>({required Widget screen}) {
    if (Platform.isAndroid) {
      return MaterialPageRoute<R>(
        settings: settings,
        builder: (_) => screen,
      );
    } else if (Platform.isIOS) {
      return CupertinoPageRoute<R>(
        settings: settings,
        builder: (_) => screen,
      );
    } else {
      throw 'Unknown platform.';
    }
  }

  final route = settings.name;
  final arguments = settings.arguments;
  switch (route) {
    case Routes.home:
      return _buildRoute(
        screen: AuthorizationScreen(),
      );
    // case Routes.eventSpeciality:
    //   return _buildRoute(
    //       screen: EventSpecialityScreen(arguments as List<Speciality>?));
    default:
      throw 'Route \'$route\' isn\'t defined.';
  }
}

PageRouteBuilder<T> buildPageRouteTransition<T>(Widget screen) {
  return PageRouteBuilder<T>(
    pageBuilder: (_, animation, secondaryAnimation) => screen,
    transitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (_, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
