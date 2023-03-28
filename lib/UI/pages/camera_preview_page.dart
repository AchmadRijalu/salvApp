import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CameraPreviewPage extends StatelessWidget {
  final XFile? picture;
   CameraPreviewPage({super.key, required this.picture});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.file(File(picture!.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 24),
          Text(picture!.name)
        ]),
      ),);
  }
}