import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/UI/pages/camera_preview_page.dart';
import 'package:salv/common/common.dart';

class CameraPage extends StatefulWidget {
  static const routeName = '/camera';
  final List<CameraDescription>? cameras;
  const CameraPage({super.key, required this.cameras});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    try {
      await _cameraController.initialize().then((value) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("Camera Error ${e}");
    }
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      print("shotted");
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CameraPreviewPage(
                    picture: picture,
                  )));
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.cameras!.isNotEmpty) {
      initCamera(widget.cameras![0]);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          _cameraController.value.isInitialized
              ? CameraPreview(_cameraController)
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                    color: Colors.black),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: IconButton(
                        onPressed: () async {
                          print("shooted");
                          await takePicture();
                        },
                        iconSize: 50,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.camera_alt_rounded,
                            color: Colors.white),
                      )),
                    ]),
              )),
        ],
      )),
    );
  }
}
