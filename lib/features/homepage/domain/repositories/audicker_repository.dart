import 'package:audickers/core/error/failure.dart';
import 'package:audickers/features/homepage/domain/entities/audicker.dart';
import 'package:dartz/dartz.dart';

abstract class AudickerRepository {
  Future<List<Audicker>> getRawAudickers();
  Future<List<Audicker>> getRenamedAudickers();
}