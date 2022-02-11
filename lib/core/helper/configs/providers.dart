import 'package:artisan/core/di/injector.dart';
import 'package:artisan/views/onboarding/presentation/profile/provider/industry_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<IndustryProvider>(create: (_) => IndustryProvider(inject())),
  ];
}
