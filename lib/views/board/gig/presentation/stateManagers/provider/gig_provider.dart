import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/viewmodels/base_model.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';
import 'package:artisan/views/board/gig/domain/source/local/gig_dao.dart';

import '../../../domain/usecase/gig_usecase.dart';

class GigProvider extends BaseModel {
  final GigUseCases _useCase;

  GigProvider(this._useCase);

  void getListOfAvailableGigs({GigEntity? entity}) async {
    try {
      final _response =
          await _useCase.getListOfAvailableGigs(Params(entity: entity));
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => availableGigsDao!.saveAvailableGigs(r.data?.data));
    } catch (e) {
      logger.e('An error occured: $e');
    }
  }
}
