import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  final Future<String> generateQRData = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
          future: generateQRData,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                return QrImage(
                  data: snapshot.data.toString(),
                  version: QrVersions.auto,
                  size: 500.0,
                );
              }
            }

            return Container();
          }),
    ));
  }
}
