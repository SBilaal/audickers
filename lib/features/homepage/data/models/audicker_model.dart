import 'dart:io';

import 'package:audickers/core/enums/file_status.dart';
import 'package:audickers/features/homepage/domain/entities/audicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sound/flutter_sound.dart';

class AudickerModel extends Audicker {
  const AudickerModel({
    @required String name,
    @required String path,
    @required Future<Duration> duration,
    @required FileStatus status,
  }) : super(name: name, path: path, status: status, duration: duration);

  factory AudickerModel.fromFile(File file) {
    var path  = file.path;

    bool isRaw = file.parent.path == "/storage/emulated/0/WhatsApp/Media/WhatsApp Audio/";
    FileStatus status = isRaw ? FileStatus.Raw : FileStatus.Renamed;

    var fileNameWithExt = file.path.replaceFirst(file.parent.path, '');
    var fileName = fileNameWithExt.split('.').first;

    var duration = FlutterSoundHelper().duration(path);

    return AudickerModel(name: fileName, path: path, status: status, duration: duration);
  }
}
