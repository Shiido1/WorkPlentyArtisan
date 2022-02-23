import 'package:artisan/core/api/gig/gig_api.dart';
import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/views/board/gig/data/model/list_of_available_gigs_response/list_of_available_gigs_response.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';
import 'package:artisan/views/board/gig/domain/source/live/gig_source.dart';

class GigSourceImpl implements GigSource {
  final GigApi _api;

  GigSourceImpl({required GigApi api}) : _api = api;

  @override
  Future<ListOfAvailableGigsResponse> listOfGigs(GigEntity entity) async {
    return await _api.getListOfAvailableGigs(entity: entity);
  }

  @override
  Future<DefaultResponse> saveGig(GigEntity entity) async {
    return await _api.saveGig(entity: entity);
  }

  @override
  Future<DefaultResponse> removeGig(GigEntity entity) async {
    return await _api.removeGig(entity: entity);
  }

  @override
  Future<ListOfAvailableGigsResponse> listOfSavedGigs(GigEntity entity) async {
    return await _api.listOfSavedGigs(entity: entity);
  }

  @override
  Future<DefaultResponse> bidGig(GigEntity entity) async {
    return await _api.submitBid(entity: entity);
  }
}
