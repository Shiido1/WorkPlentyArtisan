import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';
import 'package:artisan/views/board/gig/domain/source/local/gig_dao.dart';
import 'package:artisan/views/board/gig/presentation/stateManagers/provider/gig_provider.dart';
import 'package:artisan/views/board/gig/presentation/widget/card_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<GigProvider>(context, listen: false)
        .getListOfAvailableGigs(entity: GigEntity());
    return Scaffold(
      body: FutureBuilder(
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
              return Padding(
                padding: EdgeInsets.all(16.w),
                child: ListView(
                  children: [
                    SizedBox(height: 34.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextView(
                              text: '${_gigsList.length} Jobs Found',
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            TextView(
                                text: 'Sort:',
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w600),
                            SizedBox(width: 5.w),
                            TextView(
                                text: 'Recent',
                                maxLines: 1,
                                color: Pallets.grey,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w600),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    ..._gigsList.map((gig) => CardWidget(gig: gig)).toList()
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
