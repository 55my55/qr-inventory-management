import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_management/qr_code_print.dart';
import 'package:inventory_management/qr_code_scanner_view.dart';
import 'first_page_view.dart';

class ConfirmView extends StatelessWidget {
  ConfirmView({Key? key}) : super(key: key);

  // 入力フォーム用の変数
  String quantity = '';
  String productPosition = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('To confirm the scan results'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildConfirmView(context),
        ));
  }

  Widget _buildConfirmView(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ConfirmViewArguments?;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // QRコードに入った商品名の文字データを表示
          Text(arguments!.data),
          // 商品の個数を入力する欄
          TextField(
            autofocus: true,
            decoration: const InputDecoration(labelText: '個数を入力'),
            keyboardType: TextInputType.number, // 数字のみ
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (text) {
              // TODO: ここで取得したtextを使う
              quantity = text;
            },
          ),
          // 商品の場所を入力する欄
          TextField(
            decoration: const InputDecoration(labelText: '場所を入力'),
            onChanged: (text) {
              // TODO: ここで取得したtextを使う
              productPosition = text;
            },
          ),

          ElevatedButton(
            child: const Text('QRコード生成'),
            onPressed: () {
              // 次ページへの遷移と以下データを保持して持ってく
              // print(
              //     'Type: ${arguments.type} Data: ${arguments.data}'); // QR読み取りした商品データ
              // print(quantity);
              // print(productPosition);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        QRCodePrint(arguments.data, quantity, productPosition)),
              );
            },
          ),
        ],
      ),
    );
  }
}
