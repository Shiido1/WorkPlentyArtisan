import 'package:artisan/core/di/injector.dart';
import 'package:artisan/views/board/gig/presentation/provider/gig_provider.dart';
import 'package:artisan/views/onboarding/presentation/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<ProfileProvider>( create: (_) => ProfileProvider(inject())),
    ChangeNotifierProvider<GigProvider>( create: (_) => GigProvider(inject())),
  ];
}
