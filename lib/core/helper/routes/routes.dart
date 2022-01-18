import 'package:artisan/views/board/board.dart';
import 'package:artisan/views/onboarding/presentation/authentication/welcom_back.dart';
import 'package:flutter/cupertino.dart';

BuildContext? globalContext;

class Routes {
  static const String board = '/board';
  static const String login = '/login';

  static Map<String, Widget Function(BuildContext mainContext)> get getRoutes =>
      {
        board: (BuildContext context) {
          globalContext = context;
          return MainBoard();
        },
        login: (BuildContext context) {
          globalContext = context;
          return WelcomeBackScreen();
        }
      };
}
