import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/home_page.dart';
import 'package:salv/common/common.dart';

class HolderPage extends StatelessWidget {
  static const routeName = '/holderPage';
  const HolderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: HomePage(),
    ));
  }
}
