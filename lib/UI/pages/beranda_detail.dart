import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BerandaDetailPage extends StatelessWidget {
  static const routeName = '/berandadetail';
  const BerandaDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Beranda Detail")),
      body: Padding(
        padding: EdgeInsets.zero,
        child: Container(),
      ),
    );
  }
}
