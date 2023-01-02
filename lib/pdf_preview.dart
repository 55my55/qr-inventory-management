import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_management/pdf_creator.dart';
import 'package:pdf/widgets.dart' as pdfsheet;
import 'package:printing/printing.dart';
import 'package:qr_flutter/qr_flutter.dart';

Future<pdfsheet.Document> create() async {
  final pdf = pdfsheet.Document();

  // フォントの読み込みとオブジェクト化
  final fontData = await rootBundle.load('assets/ShipporiMincho-Regular.ttf');
  final font = pdfsheet.Font.ttf(fontData);

  // プレビュー画面
  final cover = pdfsheet.Page(
    pageTheme: pdfsheet.PageTheme(
      theme: pdfsheet.ThemeData.withFont(base: font),
    ),
    build: (pdfsheet.Context context) {
      child:
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
      ]);
    },
  );

  return pdf;
}
