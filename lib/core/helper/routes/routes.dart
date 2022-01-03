import 'package:flutter/cupertino.dart';

BuildContext? globalContext;

class Routes {
  static const String selection = '/selection';
  static const String board = '/board';
  static const String login = '/login';

  static Map<String, Widget Function(BuildContext mainContext)> get getRoutes =>
      {
        selection: (BuildContext context) {
          globalContext = context;
          return Container();
        }
      };
}
