// import 'package:artisan/core/network/network_service.dart';
// import 'package:artisan/core/network/url_config.dart';

// class SavedProfileApi {
//   final NetworkService _networkService;

//   SavedProfileApi({required NetworkService networkService})
//       : _networkService = networkService;

//   /// Saves a client gigs
//   Future<SavedProfileResponse> savedProfile(SavedProfileEntity entity) async {
//     try {
//       final _response = await _networkService.call(
//           UrlConfig.savedProfile, RequestMethod.post,
//           data: entity.toMap());
//       return SavedProfileResponse.fromJson(_response.data);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<SavedProfileModelResponse> savedProfileList() async {
//     try {
//       final _response = await _networkService.call(
//           UrlConfig.savedProfileList, RequestMethod.get);
//       return SavedProfileModelResponse.fromJson(_response.data);
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
