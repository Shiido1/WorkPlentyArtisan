import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/animated_container.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/intro_image_widget.dart';

class IntroOneScreen extends StatefulWidget {
  const IntroOneScreen({Key? key}) : super(key: key);

  @override
  _IntroOneScreenState createState() => _IntroOneScreenState();
}

class _IntroOneScreenState extends State<IntroOneScreen> {
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  final List<Widget> introWidgetsList = const <Widget>[
    IntroImageWidget(
      image: 'assets/images/intro_one.png',
      title: 'Welcome to GeoTracka',
      subTitle:
          '''Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.''',
    ),
    IntroImageWidget(
      image: 'assets/images/intro_two.png',
      title: '''Morbi non sem at metus ultrices posuere.''',
      subTitle:
          '''Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.''',
    ),
    IntroImageWidget(
      image: 'assets/images/intro_three.png',
      title: '''Morbi non sem at metus ultrices posuere.''',
      subTitle:
          '''Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.''',
    ),
  ];

  int currentPageValue = 0;
  PageController? controller = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, actions: [
        Container(
          margin: EdgeInsets.only(right: 16.w),
          alignment: Alignment.center,
          child: TextView(
            onTap: () => null,
            text: 'Skip',
            fontSize: 18,
            color: Pallets.blue,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
        ),
      ]),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: PageView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: introWidgetsList.length,
                onPageChanged: (int page) {
                  getChangedPageAndMoveBar(page);
                },
                controller: controller,
                itemBuilder: (context, index) {
                  return introWidgetsList[index];
                },
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < introWidgetsList.length; i++)
                        if (i == currentPageValue) ...[circleBar(true)] else
                          circleBar(false),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: FloatingActionButton(
                      backgroundColor: Pallets.blue,
                      child: Icon(Icons.arrow_forward, color: Pallets.white),
                      onPressed: () {
                        if (currentPageValue == 2) {
                          // PageRouter.gotoNamed(Routes.selection, context);
                        } else {
                          controller!.nextPage(
                            duration: _kDuration,
                            curve: _kCurve,
                          );
                        }
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return Center(
      child: DotsIndicator(
        color: isActive ? Pallets.blue : Pallets.blue100,
        controller: controller,
        itemCount: introWidgetsList.length,
        onPageSelected: (int page) {},
      ),
    );
  }

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }
}

class CustomeImage extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subTitle;

  const CustomeImage({
    Key? key,
    this.image,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(image!),
          TextView(
            text: title!,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          TextView(
            text: subTitle!,
            textAlign: TextAlign.center,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}
