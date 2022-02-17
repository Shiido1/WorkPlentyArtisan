import 'package:artisan/views/board/board.dart';
import 'package:artisan/views/onboarding/presentation/authentication/email_verification.dart';
import 'package:artisan/views/onboarding/presentation/authentication/reset_password.dart';
import 'package:artisan/views/onboarding/presentation/authentication/welcom_back.dart';
import 'package:artisan/views/onboarding/presentation/intro/intro_screen.dart';
import 'package:artisan/views/onboarding/presentation/profile/awaiting.dart';
import 'package:artisan/views/onboarding/presentation/profile/create_profile.dart';
import 'package:artisan/views/onboarding/presentation/profile/profile_setup.dart';
import 'package:flutter/cupertino.dart';

BuildContext? globalContext;

class Routes {
  static const String board = '/board';
  static const String login = '/login';
  static const String awaitingApproval = '/awaitingApproval';
  static const String verifyPin = '/verifyPin';
  static const String profileSetup = '/profileSetup';
  static const String createProfile = '/procreateProfilefileSetup';
  static const String forgotPassword = '/forgotPassword';
  static const String intro = '/intro';

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
        },
        verifyPin: (BuildContext context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return EmailVerificationScreen(args);
        },
        profileSetup: (BuildContext context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return SetUpProfile(args);
        },
        createProfile: (BuildContext context) {
          return CreateProfile();
        },
        forgotPassword: (BuildContext context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return ResetPasswordScreen(args);
        },
        intro: (BuildContext context) {
          return IntroOneScreen();
        },
      };
}
