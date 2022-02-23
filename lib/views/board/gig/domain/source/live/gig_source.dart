import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';

import '../../../data/model/gigs_response/gigs_response.dart';

abstract class GigSource {
  Future<GigsResponse> listOfGigs(GigEntity entity);
  Future<GigsResponse> listOfSavedGigs(GigEntity entity);
  Future<DefaultResponse> saveGig(GigEntity entity);
  Future<DefaultResponse> removeGig(GigEntity entity);
  Future<DefaultResponse> bidGig(GigEntity entity);
}
