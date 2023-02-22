import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/common/common.dart';

class LimbahBerandaPage extends StatelessWidget {
  const LimbahBerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: greenColor, borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      height: 156,
      margin: const EdgeInsets.only(bottom: 16),
    );
  }
}
