import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';

class OpenChatWindow extends StatelessWidget {
  const OpenChatWindow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
