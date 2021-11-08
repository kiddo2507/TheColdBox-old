import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:thecold_box/model/item_model.dart';
import 'package:thecold_box/screens/thecold_box.dart';

import '../main.dart';

String output = '';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  List<CameraDescription> _cameras = [];
  CameraImage? cameraImage;
  CameraController? _controller;
  bool _isReady = false;

  loadCamera() {
    _controller = CameraController(camera![0], ResolutionPreset.high);
    _controller!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          _controller!.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true);
      predictions!.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
    }
  }

  // void newItem(String? name){
  //   var item = new Item(name: output);
  // }

  loadmodel() async {
    await Tflite.loadModel(
        model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }

  @override
  void initState() {
    super.initState();
    //_setupCamera();
    loadCamera();
    loadmodel();
  }

  _setupCamera() async {
    try {
      _cameras = await availableCameras();

      _controller = CameraController(_cameras[0], ResolutionPreset.veryHigh);
      await _controller?.initialize();
    } catch (_) {}
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getBodyFromVid(),
      bottomNavigationBar: ElevatedButton(
        child: Text('Okay, add to cart'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TheColdBox()));
        },
      ),
    );
  }

  Widget cameraPreview() {
    return AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: CameraPreview(_controller!));
  }

  Widget getBodyFromVid() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: !_controller!.value.isInitialized
                  ? Container()
                  : AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: CameraPreview(_controller!),
                    ),
            ),
          ),
          Text(
            output,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
