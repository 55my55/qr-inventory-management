import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pdfsheet;

class PdfCreator extends StatelessWidget {
  PdfCreator(this.content, {super.key});
  String content;

// // 次ページ処理、再生成後に読み取ったQRコードの中身を取り出す際の方法
// String scannedCharacters;
//   String listToString(List<String> list) {
//   return list.map<String>((String value) => value.toString()).join(',');
// }
// // List<String> tokens = Arrays.asList(scannedCharacters.split("\\s*,\\s*"));
// static const productArray = content.split(',');  // => [ 'a', 'b', 'c' ]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('プレビュー画面'),
      ),
      body: Container(
          //プレビュー画面表示
          ),
    );
    throw UnimplementedError();
  }
}


// class PdfCreator extends StatelessWidget {
//   PdfCreator (String encodingCharacters);

//   String listToString(List<String> list) {
//     return list.map<String>((String value) => value.toString()).join(',');
//   }

//   static const productArray =
//       scannedCharacters.split(','); // => [ 'a', 'b', 'c' ]

  
  
//   @override
//   Widget build(Context context) {
    
//  Future<Document> create() async {
//     final pdf = Document();

//     // 表紙
//     final cover = Page(
//       build: (context) => Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               name,
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             Text(
//               quantity.toString(),
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             Text(
//               productPosition,
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             // 商品データ・個数・場所のデータをまとめたQRコードの表示
//             QrImage(
//               data: encodingCharacters, // 商品名・個数・場所がカンマで区切られた文字列
//               version: QrVersions.auto,
//               size: 200.0,
//             ),
//           ],
//         ),
//       ),
//     );

//     pdf.addPage(cover);
//     return pdf;
//   }

//     throw UnimplementedError();
//   }
// }
