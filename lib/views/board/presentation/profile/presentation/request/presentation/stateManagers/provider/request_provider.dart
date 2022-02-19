import 'package:artisan/core/enums/viewstate.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/viewmodels/base_model.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/domain/entity/request_entity.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/domain/source/local/request_dao.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/usecases/request_usecase.dart';

class RequestProvider extends BaseModel {
  final RequestUseCase _useCase;

  RequestProvider(this._useCase);

  void fetchAllRequests({RequestEntity? entity}) async {
    try {
      setState(ViewState.busy, triggerListener: false);
      final _response = await _useCase.requests(Params(entity: entity));
      _response!.fold((l) => logger.e(l.errorMessage(l)), (r) {
        logger.d(r.data?.data ?? []);
        requestDao!.saveRequests(r.data?.data ?? []);
        setState(ViewState.idle);
      });
    } catch (e) {
      logger.e(e);
      setState(ViewState.idle);
    }
  }
}
