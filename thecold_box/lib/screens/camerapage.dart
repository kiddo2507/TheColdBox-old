import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  List<CameraDescription> _cameras = [];
  late CameraController _controller;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _setupCamera();
  }

  _setupCamera() async {
    try {
      _cameras = await availableCameras();

      _controller = CameraController(_cameras[0], ResolutionPreset.medium);
      await _controller.initialize();
    } catch (_) {}
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  Widget cameraPreview() {
    return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: CameraPreview(_controller));
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    if (_isReady == false ||
        _controller == null ||
        !_controller.value.isInitialized) {
      return Container(
        width: size.width,
        height: size.height,
        child: Center(
          child: SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        ),
      );
    }
    return Container(
      width: size.width,
      height: size.height,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          child: cameraPreview()),
    );
  }
}
