import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/home_page.dart';
import 'package:salv/common/common.dart';
import 'package:salv/models/iklan_model.dart';

class HolderPage extends StatelessWidget {
  Iklan? iklan;
  static const routeName = '/holderPage';
  HolderPage({super.key, this.iklan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: HomePage(),
    ));
  }
}
