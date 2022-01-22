import 'package:artisan/core/bus/event_bus.dart';
import 'package:artisan/views/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'model/dummy_data.dart';
import 'widgets/contacts.dart';

class ContactChats extends StatelessWidget {
  const ContactChats({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            SizedBox(height: 23.h),
            SearchAndFilter(
                hint: 'Search for gigs, live consultancy, home',
                onFilter: () {
                  eventBus.fire(DrawerEvent(context, true, value: 2));
                }),
            SizedBox(height: 23.h),
            Expanded(
                child: ListView(
              children: [
                ...ChatModel.getChatsList()
                    .map((chat) => ChatContactsWidget(chat))
                    .toList()
              ],
            ))
          ],
        ),
      ),
    );
  }
}
