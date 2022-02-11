import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/onboarding/presentation/authentication/get_started_screen.dart';
import 'package:artisan/views/onboarding/presentation/authentication/welcom_back.dart';
import 'package:artisan/views/onboarding/presentation/intro/data/data_model.dart';
import 'package:artisan/views/widgets/animated_container.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroOneScreen extends StatefulWidget {
  const IntroOneScreen({Key? key}) : super(key: key);

  @override
  _IntroOneScreenState createState() => _IntroOneScreenState();
}

class _IntroOneScreenState extends State<IntroOneScreen> {
  List<DataModel> _dataModel = DataModel.getDataModel();

  int currentPageValue = 0;
  PageController? controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: PageView(
                  pageSnapping: true,
                  controller: controller,
                  onPageChanged: (int page) {
                    getChangedPageAndMoveBar(page);
                  },
                  children: _dataModel
                      .map((data) =>
                          Image.asset(data.image ?? '', fit: BoxFit.cover))
                      .toList(),
                ),
              ),
              SizedBox(height: 30.h),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 23.w, vertical: 16.h),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < _dataModel.length; i++)
                              if (i == currentPageValue) ...[
                                Container(
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Pallets.primary100),
                                    child: circleBar(true))
                              ] else
                                circleBar(false),
                          ],
                        ),
                        SizedBox(height: 35.h),
                        TextView(
                          text: _dataModel[currentPageValue].title ?? '',
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5.h),
                        TextView(
                          text: _dataModel[currentPageValue].body ?? '',
                          textAlign: TextAlign.center,
                          fontSize: 15.sp,
                          color: Pallets.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 40.h),
                        ButtonWidget(
                            buttonText: 'Get Started',
                            width: Utils.getDeviceWidth(context),
                            onPressed: () => PageRouter.gotoWidget(
                                GetStartedScreen(), context)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(vertical: 23.h),
            child: Wrap(alignment: WrapAlignment.center, children: [
              TextView(
                  text: 'Already on WorkPlenty? ',
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
              TextView(
                text: 'Sign in',
                fontSize: 17,
                fontWeight: FontWeight.w700,
                onTap: () =>
                    PageRouter.gotoWidget(WelcomeBackScreen(), context),
              ),
            ]),
          )
        ],
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return Center(
      child: DotsIndicator(
        color: isActive ? Pallets.primary100 : Pallets.lightGrey,
        controller: controller,
        itemCount: _dataModel.length,
        onPageSelected: (int page) {},
      ),
    );
  }

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }
}
