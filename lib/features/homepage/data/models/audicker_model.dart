import 'dart:io';

import 'package:audickers/core/enums/file_status.dart';
import 'package:audickers/features/homepage/domain/entities/audicker.dart';
import 'package:flutter/cupertino.dart';

class AudickerModel extends Audicker {
  const AudickerModel({
    @required String name,
    @required String path,
    @required FileStatus status,
  }) : super(name: name, path: path, status: status);

  factory AudickerModel.fromFile(File file) {
    var fileNameWithExt = file.path.replaceFirst(file.parent.path, '');
    bool isRaw = file.parent.path == "";

    var path  = file.path;
    var fileName = fileNameWithExt.split('.').first;
    FileStatus status = isRaw ? FileStatus.Raw : FileStatus.Renamed;

    return AudickerModel(name: fileName, path: path, status: status);
  }
}
