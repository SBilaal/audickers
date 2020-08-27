import 'package:flutter_share/flutter_share.dart';

class ShareFile {
  static Future<bool> call(String path, String title) async {
    bool result = await FlutterShare.shareFile(
      title: title,
      filePath: path,
      chooserTitle: "Share $title.",
    );
    return result;
  }
}
