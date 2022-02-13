import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/views/board/gig/data/model/list_of_available_gigs_response/list_of_available_gigs_response.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';

abstract class GigSource {
  Future<ListOfAvailableGigsResponse> listOfGigs(GigEntity entity);
  Future<DefaultResponse> saveGig(GigEntity entity);
}
