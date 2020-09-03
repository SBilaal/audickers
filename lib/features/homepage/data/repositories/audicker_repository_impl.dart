import 'dart:io';

import 'package:audickers/features/homepage/data/models/audicker_model.dart';
import 'package:audickers/features/homepage/domain/entities/audicker.dart';
import 'package:audickers/features/homepage/domain/repositories/audicker_repository.dart';

class AudickerRepositoryImpl implements AudickerRepository {
  final String rawPath = "/storage/emulated/0/WhatsApp/Media/WhatsApp Audio/";
  //TODO Add renamedPath.
  final String renamedPath = "";

  @override
  Future<List<Audicker>> getRawAudickers() async {
    return await _getAudicker(rawPath);
  }

  @override
  Future<List<Audicker>> getRenamedAudickers() async {
    return await _getAudicker(renamedPath);
  }

  Future<List<AudickerModel>> _getAudicker(String path) async {
    List<AudickerModel> audickerModels = [];
    List<File> files = await Directory(renamedPath).list().toList();
    files.forEach((file) {
      audickerModels.add(AudickerModel.fromFile(file));
    });
    return audickerModels;
  }
}
