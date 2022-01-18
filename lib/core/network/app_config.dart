enum Environment { development, staging, qa, production }

class AppConfig {
  static Environment environment = Environment.staging;
  static const String stagingURL = "https://sandbox.workplenty.io/api/";
  static const String productionURL = "";

  static final coreBaseUrl =
      environment == Environment.production ? productionURL : stagingURL;
}
