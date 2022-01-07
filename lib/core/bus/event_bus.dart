import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

EventBus eventBus = EventBus();

class DashboardRouteEvent {
  int index;
  DashboardRouteEvent(this.index);
}

class DrawerEvent {
  BuildContext context;
  bool open;
  DrawerEvent(this.context, this.open);
}

class UserLoggedInEvent {
  UserLoggedInEvent();
}
