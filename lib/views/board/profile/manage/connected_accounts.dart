import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:flutter/material.dart';

class ConnectedAccounts extends StatefulWidget {
  ConnectedAccounts({Key? key}) : super(key: key);

  @override
  _ConnectedAccountsState createState() => _ConnectedAccountsState();
}

class _ConnectedAccountsState extends State<ConnectedAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: defaultAppBar2(context,
          title: 'Connected Accounts',
          centerTitle: true,
          textColor: Pallets.white),
    );
  }
}
