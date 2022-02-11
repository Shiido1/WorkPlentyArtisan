import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/core/usecases/usecase.dart';
import 'package:artisan/views/onboarding/data/contractImpl/industryContractImpl.dart';
import 'package:artisan/views/onboarding/data/model/industry/general_list_of_industry_response/general_list_of_industry_response.dart';
import 'package:dartz/dartz.dart';

class IndustryUseCase extends UseCase<DefaultResponse, NoParams> {
  final IndustryContractImpl _repository;

  IndustryUseCase(this._repository);

  @override
  Future<Either<Failure, GeneralListOfIndustryResponse>>?
      generalListOfIndustries() async {
    return await _repository.generalListOfIndustry();
  }
}
