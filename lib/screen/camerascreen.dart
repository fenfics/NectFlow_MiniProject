// ignore_for_file: deprecated_member_use, use_build_context_synchronously, avoid_print

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  width: size.width,
                  height: size.height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _cameraController.value.previewSize!.height,
                      height: _cameraController.value.previewSize!.width,
                      child: CameraPreview(_cameraController),
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: size.width,
              color: Colors.black.withOpacity(0.3),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                        },
                        icon: const Icon(Icons.flash_off, color: Colors.white, size: 28),
                      ),
                      InkWell(
                        onTap: () {
                          takePhoto(context);
                        },
                        child: const Icon(Icons.panorama_fish_eye, color: Colors.white, size: 70),
                      ),
                      IconButton(
                        onPressed: () {
                        },
                        icon: const Icon(Icons.flip_camera_ios, color: Colors.white, size: 28),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Hold for video, tap for photo",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final path = join(tempDir.path, "${DateTime.now().millisecondsSinceEpoch}.png");

      XFile file = await _cameraController.takePicture();

      await file.saveTo(path);

      Navigator.pushNamed(context, '/cameraView', arguments: path);
    } catch (e) {
      print("Error taking photo: $e");
    }
  }
}
