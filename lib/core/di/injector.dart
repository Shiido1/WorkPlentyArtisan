import 'package:artisan/core/database/hive_database.dart';
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
  _initDataRepositories();
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
void _initBloc() {}

/// Initialize data sources implementations
void _initDataSources() {}

/// Initialize data repositories implementations
void _initDataRepositories() {}

/// Initialize services's here
void _initServices() {}

/// Initialize usecases here
void _initializeUsecase() {}
