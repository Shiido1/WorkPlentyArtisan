import 'dart:async';

import 'package:artisan/core/bus/event_bus.dart';
import 'package:artisan/core/database/session_manager.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/routes/routes.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:flutter/material.dart';

import 'presentation/dashboard/dashboard.dart';
import 'presentation/message/contacts_chat.dart';
import 'presentation/profile/profile.dart';
import 'presentation/saved/saved.dart';
import 'presentation/saved/tabs/search.dart';
import 'presentation/widget/custom_appbar.dart';
import 'presentation/widget/drawer_widget.dart';
import 'presentation/widget/message_drawer.dart';

// ignore: must_be_immutable
class MainBoard extends StatefulWidget {
  final int index;
  const MainBoard({Key? key, this.index = 0}) : super(key: key);

  @override
  _MainBoardState createState() => _MainBoardState();
}

class _MainBoardState extends State<MainBoard> {
  late StreamSubscription indexChangedSub;
  ValueNotifier<int> indexChangedNotifier = ValueNotifier(0);
  int? index = 0;
  List<Widget> _body = [];
  List<String> _bodyTitle = [];
  int? _drawerIndex = 1;

  @override
  void initState() {
    index = widget.index;

    _eventListener();
    super.initState();
  }

  //? listens to events when triggered
  void _eventListener() {
    eventBus.on().listen((event) async {
      if (event is DashboardRouteEvent) {
        indexChangedSub = eventBus
            .on<DashboardRouteEvent>()
            .listen(onSelectedIndexChangedEvent);
      }
      if (event is DrawerEvent) {
        eventBus.on<DrawerEvent>().listen((event) {
          _drawerIndex = event.value;
          // setState(() {});
          if (event.open) Scaffold.of(event.context).openEndDrawer();
        });
      }

      if (event is UserLoggedInEvent) {
        await SessionManager.instance.logOut();
        PageRouter.gotoNamed(Routes.login, context, clearStack: true);
      }
    });
  }

  onSelectedIndexChangedEvent(DashboardRouteEvent event) async {
    if (mounted) {
      setState(() {
        _onTap(event.index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _body = [Dashboard(), Saved(), SearchTab(), Profile(), ContactChats()];
    _bodyTitle = ["Dashboard", "Saved", "Explore", "Profile", "Message"];
    return Scaffold(
      appBar: index == 1 || index == 3
          ? null
          : getCustomAppBar(context, _bodyTitle[index!], onTap: () {}),
      endDrawer:
          _drawerIndex == 1 ? ExploreDrawerWidget() : MessageDrawerWidget(),
      body: ValueListenableBuilder(
          valueListenable: indexChangedNotifier,
          builder: (context, value, child) => Stack(
                children: <Widget>[
                  IndexedStack(
                    index: index,
                    children: _body,
                  ),
                ],
              )),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  void _onTap(int i) {
    index = i;
    setState(() {});
  }

  ValueListenableBuilder _bottomNavigationBar(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangedNotifier,
        builder: (context, value, widgetValue) => BottomNavigationBar(
              unselectedFontSize: 14,
              selectedFontSize: 14,
              onTap: _onTap,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: ImageLoader(
                      path: index == 0
                          ? AppImages.home_filled
                          : AppImages.home_outlined,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: ImageLoader(
                      path: index == 1
                          ? AppImages.archive_filled
                          : AppImages.archive_outlined,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: ImageLoader(
                      path: index == 2
                          ? AppImages.search_filled
                          : AppImages.search_outlined,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: ImageLoader(
                      path: index == 3
                          ? AppImages.profile_filled
                          : AppImages.profile_outlined,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: ImageLoader(
                      path: index == 4
                          ? AppImages.sms_filled
                          : AppImages.sms_outlined,
                    ),
                    label: ""),
              ],
              currentIndex: index!,
            ));
  }
}
