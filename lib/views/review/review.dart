import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/review/widget/review_bg_card.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/star_rating.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          centerTitle: true,
          title: 'Reviews',
          textColor: Pallets.white,
          leadingWidget: IconButton(
              onPressed: () => PageRouter.goBack(context),
              color: Pallets.white,
              icon: Icon(Icons.clear))),
      body: ListView(
        children: [
          ReviewBgCard(Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),
              StarRating(
                starCount: 5,
                rating: 4,
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
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center),
            ],
          )),
          SizedBox(height: 16.h),
          ...[1, 1, 1]
              .map(
                (_) => ReviewBgCard(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: StarRating(
                            starCount: 5,
                            rating: 4,
                          ),
                        ),
                        TextView(
                            text: '7 days ago',
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.right),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    TextView(
                        text: 'Falimi Balogun',
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.left),
                    SizedBox(height: 16.h),
                    TextView(
                        text: 'Awesome Service',
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.left),
                    SizedBox(height: 16.h),
                    TextView(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing Dignissim viverra morbi eget fames volutpat aliquam. Posuere odio a etiam maecenas vitae et.',
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.left),
                    SizedBox(height: 16.h),
                  ],
                )),
              )
              .toList()
        ],
      ),
    );
  }
}
