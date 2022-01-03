enum Environment { development, staging, qa, production }

class UrlConfig {
  //* Auth endpoints
  static const String login = 'login';
  static const String getLoggedInUser = 'auth/me';
  static const String refreshToken = 'auth/refresh';
  static const String logout = 'logout';
  static const String changePassword = 'auth/change-password';
  static const String forgotPassword = 'auth/forgot-password';
  static const String register = 'register';

  //* Task endpoints
  static const String viewTask = 'task/view';
  static const String saveReport = 'task/save/report';

  //* User endpoints
  static const String updateUserProfile = 'user/profile-update';
  static const String updateLocationPreference =
      'user/location-preference-update';
  static const String saveImage = 'user/image-save';
}
