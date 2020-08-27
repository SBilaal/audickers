import 'dart:io';

import 'package:audickers/core/services/share_file.dart';

import '../../../../core/enums/file_status.dart';
import '../entities/audicker.dart';
import '../repositories/audicker_repository.dart';

class AudickerManager {
  final AudickerRepository repository;

  AudickerManager(this.repository);

  final String renamedFilesDirectory = "";

  Future<Audicker> rename(Audicker audicker, String name) async {
    var path = audicker.path;
    var extensionName = path.split('.').last;
    var newPath = "$renamedFilesDirectory/$name.$extensionName";
    // audFile.renameSync(newPath);
    var newAudicker = Audicker(name: name, path: newPath, status: FileStatus.Renamed);
    return newAudicker;
  }

  void delete(Audicker audicker) {
    var path = audicker.path;
    var audFile = File(path);
    audFile.deleteSync();
  }

  Future<void> share(Audicker audicker) async {
    var shareFile = ShareFile();
    await shareFile(audicker.path, audicker.name);
  }

}