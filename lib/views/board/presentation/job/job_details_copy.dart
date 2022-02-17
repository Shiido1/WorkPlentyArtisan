import 'package:artisan/core/di/injector.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/helper/helper_handler.dart';
import 'package:artisan/core/helper/routes/navigation.dart';
import 'package:artisan/core/helper/routes/routes.dart';
import 'package:artisan/core/helper/utils/image_picker.dart';
import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/core/helper/utils/validators.dart';
import 'package:artisan/core/helper/utils/workplenty_dialog.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/milestone_entity.dart';
import 'package:artisan/views/board/presentation/stateManagers/bloc/gig_bloc.dart';
import 'package:artisan/views/board/presentation/stateManagers/provider/gig_provider.dart';
import 'package:artisan/views/onboarding/presentation/profile/widget/button_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/review_bg_card.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;

import 'widgets/milestone_widgets.dart';

class JobDetailsCopy extends StatefulWidget {
  const JobDetailsCopy({Key? key}) : super(key: key);

  @override
  State<JobDetailsCopy> createState() => _JobDetailsCopyState();
}

class _JobDetailsCopyState extends State<JobDetailsCopy> {
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  int _paymentTypeIndex = 0;
  List<MilestoneEntity> _mileStoneEntity = [MilestoneEntity()];
  final _filePicker = ImagePickerHandler();
  final _coverController = TextEditingController();
  final _bloc = GigBloc(inject());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: defaultAppBar2(
          context,
          title: 'Job Details',
          textColor: Pallets.white,
          centerTitle: true,
          leadingWidget: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => PageRouter.goBack(context),
              icon: Icon(Icons.arrow_back),
              color: Pallets.white),
        ),
        body: Form(
          key: _formKey,
          child: BlocListener<GigBloc, GigState>(
            bloc: _bloc,
            listener: (context, state) {
              if (state is GigLoading) {
                WorkPlenty.showLoading(context, _loadingKey, '');
              }
              if (state is GigSuccess) {
                WorkPlenty.hideLoading(_loadingKey);
              }
              if (state is GigSubmitSuccess) {
                WorkPlenty.hideLoading(_loadingKey);
                WorkPlenty.showSuccessDialog(context, _loadingKey,
                    image: AppImages.blowWhistle,
                    title: 'Job Bid Submitted',
                    message: state.response?.msg ??
                        'You’ve successfully submitted your job bid',
                    btnText: 'Go Home',
                    next: () => PageRouter.gotoNamed(Routes.board, context,
                        clearStack: true));
              }
              if (state is GigFailed) {
                WorkPlenty.hideLoading(_loadingKey);
                WorkPlenty.error(state.errorMessage);
              }
            },
            child: Consumer<GigProvider>(
              builder: (context, gigProvider, child) {
                return Stack(
                  children: [
                    ListView(
                      children: [
                        ReviewBgCard(
                            TextView(
                              text: gigProvider.datum?.title ?? '',
                              textOverflow: TextOverflow.ellipsis,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.left,
                              maxLines: 2,
                            ),
                            borderRadiusGeometry: BorderRadius.zero,
                            vertical: 37),
                        SizedBox(height: 10.h),
                        ReviewBgCard(
                            TextView(
                              text: gigProvider.datum?.description ?? '',
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left,
                            ),
                            borderRadiusGeometry: BorderRadius.zero,
                            vertical: 8),
                        SizedBox(height: 10.h),
                        ReviewBgCard(
                            Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  children: [
                                    Row(children: [
                                      SvgPicture.asset(AppImages.credit_card),
                                      SizedBox(width: 5.h),
                                      TextView(
                                        text: Utils.currency(
                                            gigProvider.datum?.totalBudget ??
                                                0),
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.left,
                                      ),
                                    ]),
                                    SizedBox(height: 15.h),
                                    Row(children: [
                                      SvgPicture.asset(AppImages.bids),
                                      SizedBox(width: 5.h),
                                      TextView(
                                        text: 'Bids',
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.left,
                                      ),
                                    ])
                                  ],
                                )),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Row(children: [
                                      SvgPicture.asset(AppImages.hour_glass),
                                      SizedBox(width: 5.h),
                                      TextView(
                                        text: gigProvider.datum?.timeline ?? '',
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.left,
                                      ),
                                    ]),
                                    SizedBox(height: 15.h),
                                    Row(children: [
                                      SvgPicture.asset(AppImages.star),
                                      SizedBox(width: 5.h),
                                      TextView(
                                        text: '',
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.left,
                                      ),
                                    ])
                                  ],
                                )),
                              ],
                            ),
                            borderRadiusGeometry: BorderRadius.zero,
                            vertical: 25.33),
                        SizedBox(height: 10.h),
                        ReviewBgCard(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(children: [
                                ImageLoader(path: AppImages.wallet),
                                TextView(
                                  text: 'Payment Type',
                                  fontWeight: FontWeight.w700,
                                  textAlign: TextAlign.left,
                                ),
                              ]),
                              SizedBox(height: 16.h),
                              Row(
                                children: [
                                  Expanded(
                                      child: ButtonWidget(
                                          radius: 10,
                                          buttonStyle: true,
                                          color: _paymentTypeIndex == 0
                                              ? Pallets.white
                                              : Pallets.grey,
                                          borderColor: _paymentTypeIndex == 0
                                              ? Pallets.primary100
                                              : Pallets.grey,
                                          primary: _paymentTypeIndex == 0
                                              ? Pallets.primary100
                                              : Colors.transparent,
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.center,
                                          fontSize: 12,
                                          buttonText: 'Milestone',
                                          onPressed: () {
                                            setState(
                                                () => _paymentTypeIndex = 0);
                                          })),
                                  SizedBox(width: 18.w),
                                  Expanded(
                                      child: ButtonWidget(
                                          radius: 10,
                                          buttonStyle: true,
                                          color: _paymentTypeIndex == 1
                                              ? Pallets.white
                                              : Pallets.grey,
                                          borderColor: _paymentTypeIndex == 1
                                              ? Pallets.primary100
                                              : Pallets.grey,
                                          primary: _paymentTypeIndex == 1
                                              ? Pallets.primary100
                                              : Colors.transparent,
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.center,
                                          fontSize: 12,
                                          buttonText: 'Project Completion',
                                          onPressed: () {
                                            _paymentTypeIndex = 1;
                                            _mileStoneEntity = [
                                              MilestoneEntity()
                                            ];
                                            setState(() {});
                                          })),
                                ],
                              ),
                            ],
                          ),
                          borderRadiusGeometry: BorderRadius.zero,
                          vertical: 17,
                        ),
                        SizedBox(height: 10.h),
                        Visibility(
                          visible: _paymentTypeIndex == 0,
                          child: ReviewBgCard(
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  ImageLoader(path: AppImages.hour_glass),
                                  TextView(
                                    text: 'Milestone',
                                    fontWeight: FontWeight.w700,
                                    textAlign: TextAlign.left,
                                  ),
                                ]),
                                ..._mileStoneEntity
                                    .map((entity) => MilestoneWidget(
                                          entity,
                                          descriptionCallback: (v) =>
                                              entity.description = v,
                                          dueDateCallback: (v) =>
                                              entity.dueDate = v,
                                          amountCallback: (v) =>
                                              entity.amount = v,
                                        ))
                                    .toList(),
                                GestureDetector(
                                  onTap: () => _addForm(),
                                  child: Row(
                                    children: [
                                      TextView(
                                        text: 'Add Milestone',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        textAlign: TextAlign.left,
                                      ),
                                      Icon(Icons.add, color: Pallets.primary100)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            borderRadiusGeometry: BorderRadius.zero,
                            vertical: 17,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ReviewBgCard(
                          Row(children: [
                            TextView(
                              text: 'Workplenty Fee',
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: TextView(
                                text: '10% of NGN100,000 = NGN90,000',
                                fontWeight: FontWeight.w700,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ]),
                          borderRadiusGeometry: BorderRadius.zero,
                          vertical: 17,
                        ),
                        SizedBox(height: 10.h),
                        ReviewBgCard(
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                ImageLoader(path: AppImages.details),
                                TextView(
                                  text: 'Details',
                                  fontWeight: FontWeight.w700,
                                  textAlign: TextAlign.left,
                                ),
                              ]),
                              SizedBox(height: 10.h),
                              EditFormField(
                                height: 117.h,
                                label: 'Type here...',
                                controller: _coverController,
                                validator: Validators.validateString(),
                              ),
                            ],
                          ),
                          borderRadiusGeometry: BorderRadius.zero,
                          vertical: 17,
                        ),
                        SizedBox(height: 10.h),
                        ReviewBgCard(
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                ImageLoader(path: AppImages.attach),
                                TextView(
                                  text: 'Attachment:',
                                  fontWeight: FontWeight.w700,
                                  textAlign: TextAlign.left,
                                ),
                              ]),
                              SizedBox(height: 10.h),
                              ButtonWidget(
                                  radius: 10,
                                  buttonStyle: true,
                                  color: Pallets.grey,
                                  fontWeight: FontWeight.w400,
                                  primary: Colors.transparent,
                                  buttonText: 'Add Attachment',
                                  onPressed: () => _pickFiles()),
                              SizedBox(height: 10.h),
                              ..._files
                                  .map((file) => TextView(
                                        text: file.name,
                                        textAlign: TextAlign.left,
                                      ))
                                  .toList(),
                              SizedBox(
                                  height: Utils.getDeviceHeight(context) * .2),
                            ],
                          ),
                          borderRadiusGeometry: BorderRadius.zero,
                          vertical: 17,
                        ),
                      ],
                    ),
                    BtnWidget(
                      showSkip: false,
                      iconWidget: SvgPicture.asset(
                        AppImages.bookmark,
                        color: Pallets.primary100,
                      ),
                      btnText: 'Bid The Bid',
                      callback: () => _bidJob(),
                      goBack: () {
                        WorkPlenty.success('Saved successfully!');
                        _bloc.add(SaveGigEvent(
                            GigEntity(id: '${gigProvider.datum?.id}')));
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }

  void _addForm() {
    _mileStoneEntity.add(MilestoneEntity());
    setState(() {});
  }

  void _bidJob() async {
    final _provider = Provider.of<GigProvider>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      _bloc.add(BidGigEvent(GigEntity(
          id: '${_provider.datum?.id}',
          paymentType:
              _paymentTypeIndex == 0 ? 'Milestone' : 'Project-Completion',
          coverMessage: _coverController.text,
          milestoneEntity: _mileStoneEntity,
          attachments: [])));
    }
  }

  List<PlatformFile> _files = [];

  void _pickFiles() async {
    final _result = await _filePicker.pickFile();
    _files = _result?.files ?? [];
    setState(() {});
  }

  /// Todo: check why im not able to send files
  Future<List<MultipartFile>> _getMultipartFile() async {
    List<MultipartFile> _m = [];
    MultipartFile _multipartFile;
    _files.map((f) async {
      _multipartFile = await MultipartFile.fromString(f.path!);
      _m.add(_multipartFile);
      setState(() {});
    }).toList();
    logger.d(_m.length);

    return _m;
  }
}
