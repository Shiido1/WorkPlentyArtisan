import 'package:artisan/core/di/injector.dart';
import 'package:artisan/views/board/presentation/profile/presentation/stateManagers/provider/profile_provider.dart';
import 'package:artisan/views/board/presentation/stateManagers/provider/gig_provider.dart';
import 'package:artisan/views/onboarding/presentation/profile/provider/profile_provider.dart';
import 'package:artisan/views/review/presentation/provider/review_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<ProfileSetUpProvider>(
        create: (_) => ProfileSetUpProvider(inject())),
    ChangeNotifierProvider<GigProvider>(create: (_) => GigProvider(inject())),
    ChangeNotifierProvider<ProfileProvider>(create: (_) => ProfileProvider(inject())),
    ChangeNotifierProvider<ReviewProvider>(create: (_) => ReviewProvider(inject())),
  ];
}
