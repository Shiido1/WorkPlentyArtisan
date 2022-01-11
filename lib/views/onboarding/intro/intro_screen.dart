import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/onboarding/authentication/get_started_screen.dart';
import 'package:artisan/views/onboarding/authentication/welcom_back.dart';
import 'package:artisan/views/onboarding/intro/data/data_model.dart';
import 'package:artisan/views/widgets/animated_container.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/image_loader.dart';
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
                child: PageView(
                  pageSnapping: true,
                  controller: controller,
                  onPageChanged: (int page) {
                    getChangedPageAndMoveBar(page);
                  },
                  children: _dataModel
                      .map((data) => Image.asset(
                            data.image ?? '',
                            fit: BoxFit.cover,
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 16.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < _dataModel.length; i++)
                            if (i == currentPageValue) ...[
                              Container(
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Pallets.primary100),
                                  child: circleBar(true))
                            ] else
                              circleBar(false),
                        ],
                      ),
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
                      fontSize: 16.sp,
                      color: Pallets.grey500,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 43.h),
                    ButtonWidget(
                        buttonText: 'Get Started',
                        width: Utils.getDeviceWidth(context),
                        onPressed: () =>
                            PageRouter.gotoWidget(GetStartedScreen(), context)),
                  ],
                ),
              ))
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(vertical: 23.h),
            child: Wrap(alignment: WrapAlignment.center, children: [
              TextView(
                  text: 'Already on WorkPlenty? ',
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              TextView(
                text: 'Sign in',
                fontSize: 16,
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
