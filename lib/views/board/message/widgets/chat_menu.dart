// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:artisan/core/helper/utils/pallets.dart';

enum ChatOptionsEnum {
  paidSession,
  freelanceJob,
  homeService,
  archive,
  bloc,
  report
}

class ChatOption extends StatelessWidget {
  Function(ChatOptionsEnum optionsEnum)? menuOptions;

  ChatOption({
    Key? key,
    required this.menuOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(Icons.more_vert),
        color: Pallets.primary100,
        itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () => menuOptions!(ChatOptionsEnum.paidSession),
                child: Text("Start a paid session",
                    style: TextStyle(color: Pallets.white)),
                value: 1,
              ),
              PopupMenuItem(
                onTap: () => menuOptions!(ChatOptionsEnum.freelanceJob),
                child: Text("Request a freelance job",
                    style: TextStyle(color: Pallets.white)),
                value: 2,
              ),
              PopupMenuItem(
                onTap: () => menuOptions!(ChatOptionsEnum.homeService),
                child: Text("Request home service",
                    style: TextStyle(color: Pallets.white)),
                value: 3,
              ),
              PopupMenuItem(
                onTap: () => menuOptions!(ChatOptionsEnum.archive),
                child: Text("Archive chat",
                    style: TextStyle(color: Pallets.white)),
                value: 4,
              ),
              PopupMenuItem(
                onTap: () => menuOptions!(ChatOptionsEnum.bloc),
                child:
                    Text("Block user", style: TextStyle(color: Pallets.white)),
                value: 5,
              ),
              PopupMenuItem(
                onTap: () => menuOptions!(ChatOptionsEnum.report),
                child:
                    Text("Report user", style: TextStyle(color: Pallets.white)),
                value: 6,
              )
            ]);
  }
}
