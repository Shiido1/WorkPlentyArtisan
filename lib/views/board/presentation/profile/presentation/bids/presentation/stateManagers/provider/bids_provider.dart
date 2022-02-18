import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/viewmodels/base_model.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/domain/entity/bid/bid_entity.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/domain/source/local/bid_dao.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/domain/usecase/bid_usecase.dart';

class BidsProvider extends BaseModel {
  final BidUseCases _useCases;

  BidsProvider(this._useCases);

  void fetchBids({BidEntity? entity}) async {
    try {
      final _response = await _useCases.listOfBids(Params(entity: entity));
      _response!
          .fold((l) => null, (r) => bidsDao!.saveBids(r.data?.data ?? []));
    } catch (e) {}
  }
}
