import 'dart:io';

import 'package:audickers/features/homepage/data/models/audicker_model.dart';
import 'package:audickers/features/homepage/domain/entities/audicker.dart';
import 'package:audickers/features/homepage/domain/repositories/audicker_repository.dart';
import 'package:path_provider/path_provider.dart';

class AudickerRepositoryImpl implements AudickerRepository {
  final String _rawPath = "/storage/emulated/0/WhatsApp/Media/WhatsApp Audio/";

  Future<String> get _renamedFilesPath async {
    return (await getApplicationDocumentsDirectory()).path + "/Audickers/Audickers";
  }

  @override
  Future<List<Audicker>> getRawAudickers() async {
    return await _getAudicker(_rawPath);
  }

  @override
  Future<List<Audicker>> getRenamedAudickers() async {
    return await _getAudicker(await _renamedFilesPath);
  }

  Future<List<AudickerModel>> _getAudicker(String path) async {
    List<AudickerModel> audickerModels = [];
    List<File> files = await Directory(path).list().toList();
    files.forEach((file) {
      audickerModels.add(AudickerModel.fromFile(file));
    });
    return audickerModels;
  }
}
