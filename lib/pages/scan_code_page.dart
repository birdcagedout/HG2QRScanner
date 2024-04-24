import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanCodePage extends StatefulWidget {
  const ScanCodePage({super.key});

  @override
  State<ScanCodePage> createState() => _ScanCodePageState();
}

class _ScanCodePageState extends State<ScanCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/generate");
            },
            icon: const Icon(
              Icons.qr_code,
            ),
          ),
        ],
      ),
      body: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
          returnImage: true,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            print('Barcode found! ${barcode.rawValue}');    // Barcode found! http://en.m.wikipedia.org
            print(barcode.corners);   // [Offset(52.0, 118.0), Offset(136.0, 125.0), Offset(133.0, 217.0), Offset(54.0, 208.0)]
          }
          // if (image != null) {
          //   showDialog(
          //     context: context,
          //     builder: (context) {
          //       return AlertDialog(
          //         title: Text(
          //           barcodes.first.rawValue ?? "",
          //         ),
          //         content: Image(
          //           image: MemoryImage(image),
          //         ),
          //       );
          //     },
          //   );
          // }
        }, // onDetect 콜백
      ),
    );
  }
}
