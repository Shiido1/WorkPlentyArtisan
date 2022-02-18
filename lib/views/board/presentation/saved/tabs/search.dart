import 'package:artisan/core/bus/event_bus.dart';
import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/board/gig/domain/source/local/gig_dao.dart';
import 'package:artisan/views/board/presentation/widget/card_widget.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/search_field.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

class SearchTab extends StatelessWidget {
  SearchTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _colors = [Color(0xff11406C), Color(0xff574C6B), Color(0xffC37F6C)];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            SizedBox(height: 23.h),
            SearchAndFilter(
                hint: 'Search for gigs, live consultancy, home',
                onFilter: () {
                  eventBus.fire(DrawerEvent(context, true));
                }),
            SizedBox(height: 31.h),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children:
                        _colors.map((e) => _skills(context, e)).toList())),
            SizedBox(height: 54.h),
            Row(children: [
              ImageLoader(path: AppImages.emoji),
              SizedBox(width: 5.w),
              Expanded(
                  child: TextView(
                text: 'Featured Gigs',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.left,
              ))
            ]),
            FutureBuilder(
              future: availableGigsDao!.getListenable(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return Container();
                }
                return ValueListenableBuilder(
                  valueListenable: snapshot.data,
                  builder: (_, Box<dynamic> value, __) {
                    final _gigsList =
                        availableGigsDao!.getConvertedData(value).toList();
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 16.h),
                        ..._gigsList
                            .map((gig) =>
                                CardWidget(gig: gig, skills: gig.skills))
                            .toList()
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  SizedBox _skills(BuildContext context, Color e) {
    return SizedBox(
      width: 200.w,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 148,
                width: Utils.getDeviceWidth(context) * .4,
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  color: e,
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                ),
              ),
              SizedBox(
                width: Utils.getDeviceWidth(context) * .4,
                child: Container(
                  height: 5.h,
                  width: Utils.getDeviceWidth(context) * .4,
                  margin: EdgeInsets.only(right: 20.w),
                  decoration: BoxDecoration(
                    color: Pallets.grey,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.r)),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
                top: 100.h, left: 16.w, right: 16.w, bottom: 16.h),
            child: TextView(
              text: 'Designs, Media & Architecture',
              maxLines: 2,
              color: Pallets.white,
              textOverflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
