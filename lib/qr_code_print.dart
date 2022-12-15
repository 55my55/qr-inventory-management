import 'package:flutter/material.dart';
import 'package:inventory_management/pdf_creator.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePrint extends StatelessWidget {
  QRCodePrint(this.name, this.quantity, this.productPosition);
  String name;
  String quantity;
  String productPosition;
  // QRコードは１つの文字列しか入れられないので、３つの変数をカンマで区切って一つに繋げた文字列にして引き渡す。
  late String encodingCharacters =
      name + "," + quantity + "," + productPosition;

// 次ページ処理、再生成後に読み取ったQRコードの中身を取り出す際の方法
// String scannedCharacters;
//   String listToString(List<String> list) {
//   return list.map<String>((String value) => value.toString()).join(',');
// }
// // List<String> tokens = Arrays.asList(scannedCharacters.split("\\s*,\\s*"));
// const productArray = scannedCharacters.split(',');  // => [ 'a', 'b', 'c' ]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('印刷画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              quantity.toString(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              productPosition,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // 商品データ・個数・場所のデータをまとめたQRコードの表示
            QrImage(
              data: encodingCharacters, // 商品名・個数・場所がカンマで区切られた文字列
              version: QrVersions.auto,
              size: 200.0,
            ),
            ElevatedButton(
              child: const Text('プレビュー'),
              onPressed: () {
                // ここにボタンを押した時に呼ばれるコードを書く
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PdfCreator('encodingCharacters')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
