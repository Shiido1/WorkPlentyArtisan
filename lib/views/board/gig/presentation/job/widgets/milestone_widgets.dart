import 'package:artisan/core/helper/utils/date_picker.dart';
import 'package:artisan/core/helper/utils/validators.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/milestone_entity.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MilestoneWidget extends StatefulWidget {
  final MilestoneEntity? entity;
  final Function(String? value)? descriptionCallback;
  final Function(String? value)? dueDateCallback;
  final Function(String? value)? amountCallback;
  const MilestoneWidget(this.entity,
      {this.descriptionCallback,
      this.amountCallback,
      this.dueDateCallback,
      Key? key})
      : super(key: key);

  @override
  State<MilestoneWidget> createState() => _MilestoneWidgetState();
}

class _MilestoneWidgetState extends State<MilestoneWidget> {
  TextEditingController? _dueDateController;
  TextEditingController? _descriptionController;
  TextEditingController? _amountController;

  @override
  void initState() {
    _dueDateController =
        TextEditingController(text: widget.entity?.dueDate ?? '');
    _descriptionController =
        TextEditingController(text: widget.entity?.description ?? '');
    _amountController =
        TextEditingController(text: widget.entity?.amount ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10.h),
        EditFormField(
          label: 'Milestone description',
          controller: _descriptionController,
          keyboardType: TextInputType.text,
          validator: Validators.validateString(),
          onChange: widget.descriptionCallback,
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
                child: EditFormField(
              label: 'Due Date',
              controller: _dueDateController,
              keyboardType: TextInputType.text,
              validator: Validators.validateString(),
              onChange: widget.dueDateCallback,
              readOnly: true,
              onTapped: () {
                pickDate(
                    context: context,
                    dateOptions: DateOptions.future,
                    onChange: (val) {
                      _dueDateController?.text = val;
                      widget.dueDateCallback!(val);
                      setState(() {});
                    });
              },
            )),
            SizedBox(width: 7.w),
            Expanded(
                child: EditFormField(
              label: 'Amount (NGN)',
              controller: _amountController,
              keyboardType: TextInputType.number,
              validator: Validators.validateInt(),
              onChange: widget.amountCallback,
            )),
          ],
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
