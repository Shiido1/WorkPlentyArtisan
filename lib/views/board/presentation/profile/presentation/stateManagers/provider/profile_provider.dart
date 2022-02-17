import 'package:artisan/core/database/session_manager.dart';
import 'package:artisan/core/entity/user/user.dart';
import 'package:artisan/core/enums/viewstate.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/viewmodels/base_model.dart';
import 'package:artisan/views/onboarding/data/model/auth_response/auth_response.dart';
import 'package:artisan/views/onboarding/domain/usecases/profile_usecases.dart';
import 'package:artisan/views/onboarding/data/model/work_history_response/datum.dart';

class ProfileProvider extends BaseModel {
  User? _user;
  User? get user => _user;

  List<Datum>? _workHistory = [];
  List<Datum>? get getWorkHistory => _workHistory;

  final ProfileUseCases _useCase;

  ProfileProvider(this._useCase);

  void getMyProfile() async {
    _user = await User.fromJson(SessionManager.instance.usersData);
    notifyListeners();
  }

  void fetchArtisansWorkHistory() async {
    try {
      setState(ViewState.busy, triggerListener: false);
      final _response = await _useCase.workHistory();
      _response!.fold((l) => logger.e(l.errorMessage(l)), (r) {
        _workHistory = r.data ?? [];
        setState(ViewState.idle);
      });
    } catch (e) {
      logger.e(e);
      setState(ViewState.idle);
    }
  }
}
