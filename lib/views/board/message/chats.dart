import 'package:artisan/core/helper/utils/images.dart';
import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'widget/message_box.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          showLeading: false,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundColor: Pallets.amber400,
                    maxRadius: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextView(
                            text: 'Gover Ward',
                            fontWeight: FontWeight.w700,
                            maxLines: 1,
                            color: Pallets.white,
                            textOverflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left),
                        Text(
                          "Online",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            _popMenu(),
          ]),
      body: SafeArea(
        child: Stack(
          children: <Widget>[MessageBox()],
        ),
      ),
    );
  }

  _popMenu() {
    return PopupMenuButton(
        icon: Icon(Icons.more_vert),
        color: Pallets.primary100,
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Start a paid session",
                    style: TextStyle(color: Pallets.white)),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Request a freelance job",
                    style: TextStyle(color: Pallets.white)),
                value: 2,
              ),
              PopupMenuItem(
                child: Text("Request home service",
                    style: TextStyle(color: Pallets.white)),
                value: 3,
              ),
              PopupMenuItem(
                child: Text("Archive chat",
                    style: TextStyle(color: Pallets.white)),
                value: 4,
              ),
              PopupMenuItem(
                child:
                    Text("Block user", style: TextStyle(color: Pallets.white)),
                value: 5,
              ),
              PopupMenuItem(
                child:
                    Text("Report user", style: TextStyle(color: Pallets.white)),
                value: 6,
              )
            ]);
  }
}
