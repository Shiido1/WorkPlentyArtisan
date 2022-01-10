import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/image_decoration.dart';
import 'package:artisan/views/widgets/review_bg_card.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  final Color leftBarColor = const Color(0xff61C5FF);
  final Color centerBarColor = const Color(0xff008BDB);
  final Color rightBarColor = const Color(0xff035584);
  final double width = 10.w;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 67, 47, 25);
    final barGroup2 = makeGroupData(1, 39, 47, 58);
    final barGroup3 = makeGroupData(2, 39, 40, 39);
    final barGroup4 = makeGroupData(3, 80, 20, 30);
    final barGroup5 = makeGroupData(4, 65, 70, 99);
    final barGroup6 = makeGroupData(5, 20, 40, 60);

    final List<BarChartGroupData> items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
          y: y1,
          colors: [leftBarColor],
          width: width,
          borderRadius: BorderRadius.zero),
      BarChartRodData(
          y: y2,
          colors: [centerBarColor],
          width: width,
          borderRadius: BorderRadius.zero),
      BarChartRodData(
          y: y3,
          colors: [rightBarColor],
          width: width,
          borderRadius: BorderRadius.zero),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          centerTitle: true, textColor: Pallets.white, title: 'Statistics'),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            Container(
              height: Utils.getDeviceHeight(context) * .4,
              child: ReviewBgCard(BarChart(
                BarChartData(
                  maxY: 100,
                  barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.grey,
                        getTooltipItem: (_a, _b, _c, _d) => null,
                      ),
                      touchCallback: (FlTouchEvent event, response) {
                        if (response == null || response.spot == null) {
                          setState(() {
                            touchedGroupIndex = -1;
                            showingBarGroups = List.of(rawBarGroups);
                          });
                          return;
                        }

                        touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                        setState(() {
                          if (!event.isInterestedForInteractions) {
                            touchedGroupIndex = -1;
                            showingBarGroups = List.of(rawBarGroups);
                            return;
                          }
                          showingBarGroups = List.of(rawBarGroups);
                          if (touchedGroupIndex != -1) {
                            var sum = 0.0;
                            for (var rod in showingBarGroups[touchedGroupIndex]
                                .barRods) {
                              sum += rod.y;
                            }
                            final avg = sum /
                                showingBarGroups[touchedGroupIndex]
                                    .barRods
                                    .length;

                            showingBarGroups[touchedGroupIndex] =
                                showingBarGroups[touchedGroupIndex].copyWith(
                              barRods: showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .map((rod) {
                                return rod.copyWith(y: avg);
                              }).toList(),
                            );
                          }
                        });
                      }),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: SideTitles(showTitles: false),
                    topTitles: SideTitles(showTitles: false),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) => const TextStyle(
                          color: Color(0xff7589a2),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      margin: 20,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'Jan';
                          case 1:
                            return 'Feb';
                          case 2:
                            return 'Mar';
                          case 3:
                            return 'Apr';
                          case 4:
                            return 'May';
                          case 5:
                            return 'June';

                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) => const TextStyle(
                          color: Color(0xff7589a2),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      margin: 8,
                      reservedSize: 28,
                      interval: 10,
                      getTitles: (value) {
                        return '${value.toInt()}';
                        // if (value == 0) {
                        //   return '1';
                        // } else if (value == 10) {
                        //   return '5';
                        // } else if (value == 19) {
                        //   return '10';
                        // } else {
                        //   return '';
                        // }
                      },
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                  gridData: FlGridData(show: false),
                ),
              )),
            ),
            SizedBox(height: 24.h),
            TextView(
              text: 'My Earning',
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w700,
              maxLines: 1,
            ),
            SizedBox(height: 16.h),
            ImageBgCard(Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Personal Balance',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      text: 'NGN 241,000',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      color: Pallets.white,
                      maxLines: 1,
                    ),
                    SizedBox(height: 16.h),
                    TextView(
                      text: 'Personal Earning',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      text: 'NGN 67,000',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      color: Pallets.white,
                      maxLines: 1,
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextView(
                      text: 'Monthly Balance',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      text: 'NGN 93,000',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      color: Pallets.white,
                      maxLines: 1,
                    ),
                    SizedBox(height: 16.h),
                    TextView(
                      text: 'Avg. Monthly',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      text: 'NGN 83,000',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      color: Pallets.white,
                      maxLines: 1,
                    ),
                  ],
                )),
              ],
            )),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                    child: TextView(
                  text: 'My Earning',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700,
                  maxLines: 1,
                )),
                Row(
                  children: [
                    TextView(
                      text: 'Sort: ',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      maxLines: 1,
                    ),
                    TextView(
                        text: 'All',
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                        color: Pallets.grey),
                    Icon(Icons.keyboard_arrow_down, color: Pallets.grey)
                  ],
                )
              ],
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(color: Pallets.grey)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _row('Job Success Rating', '4.5', star: true),
                  SizedBox(height: 8.h),
                  _row('Job Completed', '103'),
                  SizedBox(height: 8.h),
                  _row('Current Active Job', '2'),
                  SizedBox(height: 8.h),
                  _row('Number of Job Bids', '231'),
                  SizedBox(height: 8.h),
                  _row('Number of Live Consultancy', '76'),
                  SizedBox(height: 8.h),
                  _row('Number of Home Service', '76'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _row(String left, String right, {bool star = false}) {
    return Row(
      children: [
        Expanded(
          child: TextView(
            text: left,
            textAlign: TextAlign.left,
            fontWeight: FontWeight.w700,
            maxLines: 1,
          ),
        ),
        Visibility(visible: star, child: Icon(Icons.star, color: Pallets.gold)),
        SizedBox(width: 5.w),
        TextView(
          text: right,
          textAlign: TextAlign.right,
          fontWeight: FontWeight.w700,
          maxLines: 1,
        ),
      ],
    );
  }
}
