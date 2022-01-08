import 'package:artisan/views/board/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tabs/video_audio.dart';
import 'tabs/code_editor.dart';

class LiveSession extends StatelessWidget {
  const LiveSession({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: getCustomAppBar(context, 'Live Session',
            showLeading: true,
            bottom: TabBar(
              tabs: [
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text('Video & Audio')),
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text('Code Editor')),
              ],
            )),
        body: TabBarView(
          children: [
            VideoAudioTab(),
            EditorTab(),
          ],
        ),
      ),
    );
  }
}
