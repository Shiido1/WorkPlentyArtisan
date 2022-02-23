import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/routes/routes.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/domain/entity/request_entity.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/domain/source/local/request_dao.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/presentation/stateManagers/bloc/request_bloc.dart';
import 'package:artisan/views/session/session.dart';
import 'package:artisan/views/widgets/bottom_sheet.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/review_bg_card.dart';
import 'package:artisan/views/widgets/star_rating.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/adapters.dart';

final _bloc = RequestBloc(inject());
final _loadingKey = GlobalKey<FormState>();

class LiveTab extends StatelessWidget {
  const LiveTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestBloc, RequestState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is RequestLoading) {
          WorkPlenty.showLoading(context, _loadingKey, '');
        }
        if (state is RequestSuccess) {
          WorkPlenty.hideLoading(_loadingKey);
          _showModal(context);
        }

        if (state is RequestFailed) {
          WorkPlenty.hideLoading(_loadingKey);
          WorkPlenty.error(state.message ?? '');
        }
      },
      child: ValueListenableBuilder(
          valueListenable: requestDao!.getListenable()!,
          builder: (_, Box<dynamic> value, __) {
            final _list = requestDao!.getConvertedData(value).toList();
            return Padding(
              padding: EdgeInsets.all(16.w),
              child: ListView(
                children: [
                  SizedBox(height: 23.h),
                  ..._list
                      .map((e) => Container(
                            margin: EdgeInsets.only(bottom: 16.h),
                            child: ReviewBgCard(
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 20.r,
                                    backgroundColor: Pallets.primary100,
                                  ),
                                  SizedBox(width: 8.h),
                                  Expanded(
                                      child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text:
                                            'Daniel James request a live consultancy session',
                                        fontWeight: FontWeight.w500,
                                        textAlign: TextAlign.left,
                                        color: Pallets.mildGrey100,
                                        textOverflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(
                                                    AppImages.free_session),
                                                SizedBox(width: 4.w),
                                                TextView(
                                                  text: 'Free Session',
                                                  fontWeight: FontWeight.w400,
                                                  color: Pallets.mildGrey100,
                                                  fontSize: 12,
                                                  textAlign: TextAlign.left,
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                )
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              StarRating(
                                                  starCount: 5, rating: 4.5),
                                              SizedBox(width: 5.w),
                                              TextView(
                                                text: '4.5',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Pallets.mildGrey100,
                                                textAlign: TextAlign.right,
                                                maxLines: 1,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 18.h),
                                      // e.status == "pending"
                                      //     ? TextView(
                                      //         text: 'Session was accepted',
                                      //         fontWeight: FontWeight.w400,
                                      //         fontSize: 12,
                                      //         textAlign: TextAlign.left,
                                      //         textOverflow:
                                      //             TextOverflow.ellipsis,
                                      //       )
                                      //     : Row(
                                      //         children: [
                                      //           Expanded(
                                      //               child: Container(
                                      //             padding: EdgeInsets.symmetric(
                                      //                 horizontal: 16.w,
                                      //                 vertical: 8.h),
                                      //             decoration: BoxDecoration(
                                      //                 borderRadius:
                                      //                     BorderRadius.circular(
                                      //                         5.r),
                                      //                 border: Border.all(
                                      //                     color: Pallets
                                      //                         .primary100)),
                                      //             child: TextView(
                                      //               text: 'Decline',
                                      //               fontWeight: FontWeight.w700,
                                      //               fontSize: 12,
                                      //               textAlign: TextAlign.center,
                                      //             ),
                                      //           )),
                                      //           Spacer(),
                                      //           Expanded(
                                      //               child: GestureDetector(
                                      //             onTap: () {
                                      //               _bloc.add(
                                      //                   AcceptOrDeclineEvent(
                                      //                       entity: RequestEntity(
                                      //                           requestID: e.id,
                                      //                           action:
                                      //                               'ACCEPT')));
                                      //             },
                                      //             child: Container(
                                      //               padding:
                                      //                   EdgeInsets.symmetric(
                                      //                       horizontal: 16.w,
                                      //                       vertical: 8.h),
                                      //               decoration: BoxDecoration(
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(5.r),
                                      //                   color:
                                      //                       Pallets.primary100),
                                      //               child: TextView(
                                      //                 text: 'Accept',
                                      //                 fontWeight:
                                      //                     FontWeight.w700,
                                      //                 fontSize: 12,
                                      //                 color: Pallets.white,
                                      //                 textAlign:
                                      //                     TextAlign.center,
                                      //               ),
                                      //             ),
                                      //           ))
                                      //         ],
                                      //       )
                                    ],
                                  ))
                                ],
                              ),
                              vertical: 17,
                            ),
                          ))
                      .toList()
                ],
              ),
            );
          }),
    );
  }

  _showModal(BuildContext context) {
    BottomSheets.showSheet(context,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 42.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppImages.video_player),
              SizedBox(height: 30.h),
              TextView(
                text: 'Join Daniel James on a live session',
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),
              ButtonWidget(
                  buttonText: 'Join Session',
                  onPressed: () {
                    PageRouter.gotoWidget(LiveSession(), context);
                  })
            ],
          ),
        ));
  }
}
