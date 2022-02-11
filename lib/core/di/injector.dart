import 'package:artisan/core/api/auth/auth_service.dart';
import 'package:artisan/core/database/hive_database.dart';
import 'package:artisan/core/network/network_service.dart';
import 'package:artisan/views/onboarding/data/contractImpl/authorization_impl.dart';
import 'package:artisan/views/onboarding/data/sourceImpl/authorization_source_contract_impl.dart';
import 'package:artisan/views/onboarding/domain/usecases/forgot_password_usecase.dart';
import 'package:artisan/views/onboarding/domain/usecases/login_usecase.dart';
import 'package:artisan/views/onboarding/domain/usecases/register_usecase.dart';
import 'package:artisan/views/onboarding/domain/usecases/reset_password_usecase.dart';
import 'package:artisan/views/onboarding/presentation/authentication/login/bloc/login_bloc.dart';
import 'package:artisan/views/onboarding/presentation/authentication/password/bloc/password_bloc.dart';
import 'package:artisan/views/onboarding/presentation/authentication/register/bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';

import '../database/session_manager.dart';
import '../network/app_config.dart';

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
  inject.registerLazySingleton<RegisterBloc>(() => RegisterBloc(inject()));
  inject.registerLazySingleton<LoginBloc>(() => LoginBloc(inject()));
  inject.registerLazySingleton<PasswordBloc>(
      () => PasswordBloc(inject(), inject()));
}

/// Initialize data sources implementations
void _initDataSources() {
  inject.registerLazySingleton<AuthorizationSourcesImpl>(
      () => AuthorizationSourcesImpl(authorizationService: inject()));
}

/// Initialize data repositories implementations
void _initDataContracts() {
  inject.registerLazySingleton<AuthorizationContractImpl>(
      () => AuthorizationContractImpl(inject()));
}

/// Initialize services's here
void _initServices() {
  inject.registerLazySingleton<NetworkService>(
      () => NetworkService(baseUrl: AppConfig.coreBaseUrl));
  inject.registerLazySingleton<AuthorizationService>(
      () => AuthorizationService(networkService: inject()));
}

/// Initialize usecases here
void _initializeUsecase() {
  inject
      .registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(inject()));
  inject.registerLazySingleton<LoginUseCase>(() => LoginUseCase(inject()));
  inject.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(inject()));
  inject.registerLazySingleton<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(inject()));
}
