import 'package:artisan/core/api/auth/auth_api.dart';
import 'package:artisan/core/api/gig/gig_api.dart';
import 'package:artisan/core/api/profile/profile_api.dart';
import 'package:artisan/core/api/review/review_api.dart';
import 'package:artisan/core/database/hive_database.dart';
import 'package:artisan/core/network/network_service.dart';
import 'package:artisan/views/board/gig/data/contractImpl/gigContractImpl.dart';
import 'package:artisan/views/board/gig/data/sourceImpl/gigSourceImpl.dart';
import 'package:artisan/views/board/gig/domain/usecase/gig_usecase.dart';
import 'package:artisan/views/onboarding/data/contractImpl/authContractImpl.dart';
import 'package:artisan/views/onboarding/data/contractImpl/profileContractImpl.dart';
import 'package:artisan/views/onboarding/data/sourceImpl/authSourceImpl.dart';
import 'package:artisan/views/onboarding/data/sourceImpl/profileSourceImpl.dart';
import 'package:artisan/views/onboarding/domain/usecases/auth_usecase.dart';
import 'package:artisan/views/onboarding/domain/usecases/profile_usecases.dart';
import 'package:artisan/views/onboarding/presentation/authentication/bloc/authbloc_bloc.dart';
import 'package:artisan/views/onboarding/presentation/profile/bloc/profile_bloc.dart';
import 'package:artisan/views/review/data/contractImpl/reviewContractImpl.dart';
import 'package:artisan/views/review/data/sourceImpl/reviewSourceImpl.dart';
import 'package:artisan/views/review/domain/usecases/review_usecase.dart';
import 'package:get_it/get_it.dart';
import '../network/app_config.dart';
import '../database/session_manager.dart';

final inject = GetIt.instance;
final sessionManager = SessionManager();
final hiveManager = HiveManager();

Future<void> initializeCore({required Environment environment}) async {
  AppConfig.environment = environment;
  await _initializeCore();
  _initServices();
  _initProviders();
  _initBloc();
  _initDataSources();
  _initDataContracts();
  _initializeUsecase();
}

/// Initialize the core functions here
Future<void> _initializeCore() async {
  await hiveManager.initializeDatabase();
  await sessionManager.initializeSession();
  inject.registerLazySingleton<HiveManager>(() => hiveManager);
  inject.registerLazySingleton<SessionManager>(() => sessionManager);
}

/// Initialize providers here
void _initProviders() {}

/// Initialize bloc's here
void _initBloc() {
  inject.registerLazySingleton<AuthblocBloc>(() => AuthblocBloc(inject()));
  inject.registerLazySingleton<ProfileBloc>(() => ProfileBloc(inject()));
}

/// Initialize data sources implementations
void _initDataSources() {
  inject.registerLazySingleton<AuthSourceImpl>(
      () => AuthSourceImpl(api: inject()));
  inject.registerLazySingleton<ProfileSourceImpl>(
      () => ProfileSourceImpl(api: inject()));
  inject
      .registerLazySingleton<GigSourceImpl>(() => GigSourceImpl(api: inject()));
  inject.registerLazySingleton<ReviewSourceImpl>(
      () => ReviewSourceImpl(api: inject()));
}

/// Initialize data repositories implementations
void _initDataContracts() {
  inject.registerLazySingleton<AuthContractImpl>(
      () => AuthContractImpl(inject()));
  inject.registerLazySingleton<ProfileContractImpl>(
      () => ProfileContractImpl(inject()));
  inject
      .registerLazySingleton<GigContractImpl>(() => GigContractImpl(inject()));
  inject.registerLazySingleton<ReviewContractImpl>(
      () => ReviewContractImpl(inject()));
}

/// Initialize services's here
void _initServices() {
  inject.registerLazySingleton<NetworkService>(
      () => NetworkService(baseUrl: AppConfig.coreBaseUrl));
  inject
      .registerLazySingleton<AuthApi>(() => AuthApi(networkService: inject()));
  inject.registerLazySingleton<ProfileApi>(
      () => ProfileApi(networkService: inject()));
  inject.registerLazySingleton<GigApi>(() => GigApi(networkService: inject()));
  inject.registerLazySingleton<ReviewApi>(
      () => ReviewApi(networkService: inject()));
}

/// Initialize usecases here
void _initializeUsecase() {
  inject.registerLazySingleton<AuthUsesCases>(() => AuthUsesCases(inject()));
  inject
      .registerLazySingleton<ProfileUseCases>(() => ProfileUseCases(inject()));
  inject.registerLazySingleton<GigUseCases>(() => GigUseCases(inject()));
  inject.registerLazySingleton<ReviewUseCases>(() => ReviewUseCases(inject()));
}
