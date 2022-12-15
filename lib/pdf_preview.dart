import 'dart:js';

import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Document> create() async {
  final pdf = Document();

  // フォントの読み込みとオブジェクト化
  final fontData = await rootBundle.load('assets/ShipporiMincho-Regular.ttf');
  final font = Font.ttf(fontData);

  // プレビュー画面
  final cover = Page(
      pageTheme: PageTheme(
        theme: ThemeData.withFont(base: font),
      ),
      build: (context) => Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                          builder: (context) =>
                              PdfCreator('encodingCharacters')),
                    );
                  },
                ),
              ])));

  return pdf;
}
