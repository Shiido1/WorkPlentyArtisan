import 'package:artisan/core/enums/viewstate.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/viewmodels/base_model.dart';
import 'package:artisan/views/onboarding/data/model/industry/general_list_of_industry_response/datum.dart';
import 'package:artisan/views/onboarding/domain/usecases/industry_usecases.dart';

class IndustryProvider extends BaseModel {
  final IndustryUseCase _useCase;

  IndustryProvider(this._useCase);

  List<Datum>? _data = [];

  List<Datum>? get data => _data;

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
}
