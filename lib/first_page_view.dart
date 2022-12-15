import 'package:flutter/material.dart';
import 'package:inventory_management/qr_code_scanner_view.dart';
import 'confirm_view.dart';

class Const {
  static const routeFirstPage = '/home';
  static const routeQRCodeScanner = '/qr-code-scanner';
  static const routeConfirm = '/confirm';
}

class FirstPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      routes: <String, WidgetBuilder>{
        Const.routeFirstPage: (BuildContext context) => FirstPageView(),
        Const.routeQRCodeScanner: (BuildContext context) => QRCodeScannerView(),
        Const.routeConfirm: (BuildContext context) => ConfirmView(),
      },
      home: _FirstPage(),
    );
  }
}

class _FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('QR code scanner'),
      ),
      body: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QRCodeScannerView()),
          );
        },
        child: const Text('読み取り開始'),
      ),
    );
  }

  // Future<void> showRequestPermissionDialog(BuildContext context) async {
  //   await showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('カメラを許可してください'),
  //         content: const Text('QRコードを読み取る為にカメラを利用します'),
  //         actions: <Widget>[
  //           ElevatedButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: const Text('キャンセル'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () async {
  //               openAppSettings();
  //             },
  //             child: const Text('設定'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
