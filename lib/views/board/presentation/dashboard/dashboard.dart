import 'package:artisan/core/enums/viewstate.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';
import 'package:artisan/views/board/gig/domain/source/local/gig_dao.dart';
import 'package:artisan/views/board/presentation/job/job_details.dart';
import 'package:artisan/views/board/presentation/stateManagers/provider/gig_provider.dart';
import 'package:artisan/views/board/presentation/widget/card_widget.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<GigProvider>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: availableGigsDao!.getListenable(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return SpinKitCircle(color: Pallets.blue, size: 50.0);
          }
          _provider.getListOfAvailableGigs(entity: GigEntity());

          return ValueListenableBuilder(
            valueListenable: snapshot.data,
            builder: (_, Box<dynamic> value, __) {
              final _gigsList =
                  availableGigsDao!.getConvertedData(value).toList();
              return Consumer<GigProvider>(
                builder: (context, gig, child) {
                  if (gig.state == ViewState.busy) {
                    return SpinKitCircle(color: Pallets.blue, size: 50.0);
                  }
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
                        ..._gigsList
                            .map((gig) => CardWidget(
                                  gig: gig,
                                  skills: gig.skills,
                                  onPressed: () {
                                    _provider.setGig(gig);
                                    PageRouter.gotoWidget(
                                        JobDetails(), context);
                                  },
                                ))
                            .toList()
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
