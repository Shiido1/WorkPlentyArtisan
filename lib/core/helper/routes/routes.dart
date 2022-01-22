import 'package:artisan/views/board/board.dart';
import 'package:artisan/views/onboarding/presentation/authentication/login/welcom_back.dart';
import 'package:artisan/views/onboarding/presentation/profile/awaiting_approval.dart';
import 'package:flutter/cupertino.dart';

BuildContext? globalContext;

class Routes {
  static const String board = '/board';
  static const String login = '/login';
  static const String awaitingApproval = '/awaitingApproval';

  static Map<String, Widget Function(BuildContext mainContext)> get getRoutes =>
      {
        board: (BuildContext context) {
          globalContext = context;
          return MainBoard();
        },
        login: (BuildContext context) {
          globalContext = context;
          return WelcomeBackScreen();
        },
        awaitingApproval: (BuildContext context) {
          globalContext = context;
          return AwaitingApproval();
        }
      };
}
