import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/viewmodels/base_model.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';
import 'package:artisan/views/board/gig/domain/source/local/gig_dao.dart';
import 'package:artisan/views/board/gig/domain/source/local/saved_gigs_dao.dart';
import 'package:artisan/views/board/gig/domain/usecase/gig_usecase.dart';

import '../../../../../core/entity/datum/datum.dart';

class GigProvider extends BaseModel {
  final GigUseCases _useCase;

  GigProvider(this._useCase);

  /// INSTANCES
  Datum? _datum;
  Datum? get datum => _datum;

  /// RETURN list of available gigs
  void getListOfAvailableGigs({GigEntity? entity}) async {
    try {
      final _response =
          await _useCase.getListOfAvailableGigs(Params(entity: entity));
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => availableGigsDao!.saveAvailableGigs(r.data?.data));
    } catch (e) {
      logger.e('An error occurred: $e');
    }
  }

  /// RETURN list of saved gigs
  void getAllSavedGigs({GigEntity? entity}) async {
    try {
      final _response = await _useCase.listOfSavedGigs(Params(entity: entity));
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => savedGigsDao!.listOfSavedGigs(r.data?.data ?? []));
    } catch (e) {
      logger.e('An error occurred: $e');
    }
  }

  /// Set gig for transferring
  void setGig(Datum? datum) {
    _datum = datum;
    notifyListeners();
  }
}
