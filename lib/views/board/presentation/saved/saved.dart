import 'package:artisan/core/enums/gig_type.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';
import 'package:artisan/views/board/gig/domain/source/local/saved_gigs_dao.dart';
import 'package:artisan/views/board/presentation/stateManagers/provider/gig_provider.dart';
import 'package:artisan/views/board/presentation/widget/custom_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'tabs/saved_tab.dart';

class Saved extends StatelessWidget {
  final Widget? widget;
  const Saved({this.widget, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<GigProvider>(context, listen: false)
        .getAllSavedGigs(entity: GigEntity());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: getCustomAppBar(context, 'Saved',
            bottom: TabBar(
              tabs: [
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: TextView(
                      text: 'Freelance',
                      color: Pallets.white,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: TextView(
                      text: 'Home Service',
                      color: Pallets.white,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: TextView(
                      text: 'Live Consultancy',
                      color: Pallets.white,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    )),
              ],
            )),
        body: FutureBuilder(
          future: savedGigsDao?.getListenable(),
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                !snapshot.hasData) {
              return Container();
            }
            return ValueListenableBuilder(
              valueListenable: snapshot.data,
              builder: (_, Box<dynamic> value, __) {
                final _list = savedGigsDao!.getConvertedData(value).toList();
                return TabBarView(
                  children: [
                    SavedTab(
                        gigs: _list
                            .where(
                                (element) => element.type == GigType.FREELANCE)
                            .toList()),
                    SavedTab(
                        gigs: _list
                            .where((element) => element.type == GigType.HOME)
                            .toList()),
                    SavedTab(
                        gigs: _list
                            .where((element) => element.type == GigType.LIVE)
                            .toList()),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
