import 'package:artisan/core/enums/viewstate.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/viewmodels/base_model.dart';
import 'package:artisan/views/onboarding/data/model/industry_categories_response/datum.dart'
    as categories;
import 'package:artisan/views/onboarding/data/model/general_list_of_industry_response/datum.dart';
import 'package:artisan/views/onboarding/data/model/skills_response/datum.dart'
    as skills;
import 'package:artisan/views/onboarding/data/model/work_history_response/datum.dart'
    as workHistory;

import 'package:artisan/views/onboarding/domain/usecases/profile_usecases.dart';

class ProfileSetUpProvider extends BaseModel {
  final ProfileUseCases _useCase;

  ProfileSetUpProvider(this._useCase);

  List<Datum>? _data = [];

  List<Datum>? get data => _data;

  List<categories.Datum>? _categoriesOfGigs = [];

  List<categories.Datum>? get categoriesOfGigs => _categoriesOfGigs;

  List<skills.Datum>? _skills = [];
  List<skills.Datum>? get getSkills => _skills;

  List<workHistory.Datum>? _workHistory = [];
  List<workHistory.Datum>? get getWorkHistory => _workHistory;

  void fetchListOfIndustries() async {
    try {
      setState(ViewState.busy, triggerListener: false);
      final _response = await _useCase.generalListOfIndustries();
      _response!.fold((l) => logger.e(l.errorMessage(l)), (r) {
        _data = r.data ?? [];
        setState(ViewState.idle);
      });
    } catch (e) {
      logger.e(e);
      setState(ViewState.idle);
    }
  }

  void fetchCategoryOfGigs() async {
    try {
      setState(ViewState.busy, triggerListener: false);
      final _response = await _useCase.gigCategory();
      _response!.fold((l) => logger.e(l.errorMessage(l)), (r) {
        _categoriesOfGigs = r.data?.data ?? [];
        setState(ViewState.idle);
      });
    } catch (e) {
      logger.e(e);
      setState(ViewState.idle);
    }
  }

  void fetchSkills() async {
    try {
      setState(ViewState.busy, triggerListener: false);
      final _response = await _useCase.listOfSkills();
      _response!.fold((l) => logger.e(l.errorMessage(l)), (r) {
        _skills = r.data ?? [];
        setState(ViewState.idle);
      });
    } catch (e) {
      logger.e(e);
      setState(ViewState.idle);
    }
  }

  void fetchArtisansWorkHistory() async {
    try {
      setState(ViewState.busy);
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

  void fetchConfigs() async {
    try {
      setState(ViewState.busy);
      final _response = await _useCase.configs();
      _response!.fold((l) => logger.e(l.errorMessage(l)), (r) {
        logger.d(r.data?.toJson());
        setState(ViewState.idle);
      });
    } catch (e) {
      logger.e(e);
      setState(ViewState.idle);
    }
  }
}
