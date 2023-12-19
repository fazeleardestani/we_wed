import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;


class MaskedImage extends StatefulWidget {
  final String imageUrl;
  final String imageLocalPath;

  const MaskedImage({
    required this.imageUrl,
    required this.imageLocalPath,
    super.key,
  });

  @override
  _MaskedImageState createState() => _MaskedImageState();
}

class _MaskedImageState extends State<MaskedImage> {
  late Future<Uint8List> _compositeImagesFuture;

  @override
  void initState() {
    super.initState();
    _compositeImagesFuture = _compositeImages();
  }

  Future<Uint8List> _compositeImages() async {
    // Load the images
    String imageUrl = '';
    String imageLocalPath = '';

    final networkImage = NetworkImage(imageUrl);
    final completer = Completer<ui.Image>();
    networkImage.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((info, _) {
        completer.complete(info.image);
      }),
    );
    final image2 = await completer.future;

    ByteData data1 = await rootBundle.load(imageLocalPath);
    Uint8List bytes1 = data1.buffer.asUint8List();
    ui.Codec codec1 = await ui.instantiateImageCodec(bytes1);
    ui.FrameInfo frameInfo1 = await codec1.getNextFrame();
    ui.Image image1 = frameInfo1.image;

    // Create a mask
    Paint maskPaint = Paint();
    maskPaint.shader = ui.ImageShader(
      image2,
      TileMode.clamp,
      TileMode.clamp,
      Float64List.fromList([
        1, 0, 0, 0,
        0, 1, 0, 0,
        0, 0, 1, 0,
        0, 0, 0, 1,
      ]),
    );

    // Create an image resulting from the combination
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    canvas.drawImage(image1, Offset.zero, Paint());
    canvas.drawRect(Rect.fromPoints(Offset.zero, Offset(image1.width.toDouble(), image1.height.toDouble())), maskPaint);

    final picture = recorder.endRecording();
    final img = await picture.toImage(image1.width, image1.height);
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final buffer = byteData!.buffer.asUint8List();

    return buffer;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _compositeImagesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Display the image resulting from the combination
          return Image.memory(snapshot.data as Uint8List);
        } else {
          // Display a spinner or any other symbol during processing
          return CircularProgressIndicator();
        }
      },
    );
  }
}
