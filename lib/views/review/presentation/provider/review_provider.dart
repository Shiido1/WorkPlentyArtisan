import 'package:artisan/core/enums/viewstate.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/viewmodels/base_model.dart';
import 'package:artisan/views/review/domain/entity/review_entity.dart';
import 'package:artisan/views/review/domain/source/dao/review_dao.dart';
import 'package:artisan/views/review/domain/usecases/review_usecase.dart';

class ReviewProvider extends BaseModel {
  final ReviewUseCases _useCase;

  ReviewProvider(this._useCase);

  void fetchReviews({ReviewEntity? entity}) async {
    try {
      setState(ViewState.busy, triggerListener: false);
      final _response = await _useCase.reviews(Params(entity: entity));
      _response!.fold((l) => logger.e(l.errorMessage(l)), (r) {
        reviewDao!.saveReviews(r.data?.data ?? []);
        setState(ViewState.idle);
      });
    } catch (e) {
      logger.e(e);
      setState(ViewState.idle);
    }
  }
}
