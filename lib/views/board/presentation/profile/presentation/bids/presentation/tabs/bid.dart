import 'package:artisan/views/board/presentation/profile/presentation/bids/domain/entity/bid/bid_entity.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/domain/source/local/bid_dao.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/presentation/stateManagers/provider/bids_provider.dart';
import 'package:artisan/views/board/presentation/stateManagers/provider/gig_provider.dart';
import 'package:artisan/views/board/presentation/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class BidTab extends StatelessWidget {
  const BidTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<BidsProvider>(context, listen: false);
    final _gigProvider = Provider.of<GigProvider>(context, listen: false);
    _provider.fetchBids(entity: BidEntity());
    return ValueListenableBuilder(
      valueListenable: bidsDao!.getListenable()!,
      builder: (_, Box<dynamic> value, __) {
        final _bidsList = bidsDao!.getConvertedData(value).toList();
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: ListView(
            children: [
              SizedBox(height: 23.h),
              ..._bidsList
                  .map((bid) => CardWidget(
                        gig: bid,
                        skills: bid.gig?.skills,
                        onPressed: () {
                          // _gigProvider.setGig(bid);
                          // PageRouter.gotoWidget(JobDetails(), context);
                        },
                      ))
                  .toList()
            ],
          ),
        );
      },
    );
  }
}
