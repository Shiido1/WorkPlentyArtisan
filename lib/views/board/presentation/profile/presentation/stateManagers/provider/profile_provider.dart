import 'package:artisan/core/database/session_manager.dart';
import 'package:artisan/core/entity/user/user.dart';
import 'package:artisan/core/viewmodels/base_model.dart';
import 'package:artisan/views/onboarding/data/model/auth_response/auth_response.dart';

class ProfileProvider extends BaseModel {
  User? _user;
  User? get user => _user;

  void getMyProfile() async {
    _user = await User.fromJson(SessionManager.instance.usersData);
    notifyListeners();
  }
}
