import 'dart:async';
import 'dart:io';

import 'package:citiquiz/features/qr/bloc/qr_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrViewScreeen extends StatefulWidget {
  const QrViewScreeen({super.key});

  @override
  State<QrViewScreeen> createState() => _QrViewScreeenState();
}

class _QrViewScreeenState extends State<QrViewScreeen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    StreamSubscription<Barcode> sub =
        controller.scannedDataStream.listen((scanData) {
      result = scanData;
      if (result != null) {
        BlocProvider.of<QrBloc>(context).add(AddQr(qr: result!.code ?? "---"));
      }
      Navigator.of(context).pop();
      return;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
