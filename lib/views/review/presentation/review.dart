import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/time_helper.dart';
import 'package:artisan/views/review/domain/entity/review_entity.dart';
import 'package:artisan/views/review/domain/source/dao/review_dao.dart';
import 'package:artisan/views/review/presentation/provider/review_provider.dart';
import 'package:artisan/views/widgets/review_bg_card.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/star_rating.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<ReviewProvider>(context, listen: false)
        .fetchReviews(entity: ReviewEntity());
    return Scaffold(
      appBar: defaultAppBar2(context,
          centerTitle: true,
          title: 'Reviews',
          textColor: Pallets.white,
          leadingWidget: IconButton(
              onPressed: () => PageRouter.goBack(context),
              color: Pallets.white,
              icon: Icon(Icons.clear))),
      body: ValueListenableBuilder(
        valueListenable: reviewDao!.getListenable()!,
        builder: (_, Box<dynamic> value, __) {
          final _reviewList = reviewDao!.getConvertedData(value).toList();
          return ListView(
            children: [
              ReviewBgCard(Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),
                  StarRating(
                    starCount: 5,
                    rating: 4,
                    starSize: 40,
                  ),
                  SizedBox(height: 16.h),
                  TextView(
                      text: '4.7',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      textAlign: TextAlign.center),
                  SizedBox(height: 10.h),
                  TextView(
                      text: '(31 Reviews)',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      textAlign: TextAlign.center),
                ],
              )),
              SizedBox(height: 16.h),
              ..._reviewList
                  .map(
                    (review) => Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      child: ReviewBgCard(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Expanded(
                                  child: StarRating(
                                    starCount: 5,
                                    rating: review.rating?.toDouble() ?? 0,
                                  ),
                                ),
                                TextView(
                                    text: TimeUtil.convertToAgo(
                                        review.createdAt ?? ''),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    textAlign: TextAlign.right),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            TextView(
                                text:
                                    '${review.reviewer?.firstName ?? ''} ${review.reviewer?.lastName ?? ''}',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                textAlign: TextAlign.left),
                            SizedBox(height: 16.h),
                            TextView(
                                text: 'Awesome Service',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                textAlign: TextAlign.left),
                            SizedBox(height: 16.h),
                            TextView(
                                text: review.comment ?? '',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Pallets.primary150,
                                textAlign: TextAlign.left),
                            SizedBox(height: 16.h),
                          ],
                        ),
                        borderRadiusGeometry: BorderRadius.zero,
                        vertical: 17,
                      ),
                    ),
                  )
                  .toList()
                  .reversed
                  .toList()
            ],
          );
        },
      ),
    );
  }
}
