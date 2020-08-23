import 'package:audickers/core/error/failure.dart';
import 'package:audickers/features/homepage/domain/entities/audicker.dart';
import 'package:dartz/dartz.dart';

abstract class AudickerRepository {
  Future<Either<Failure,Audicker>> getRawAudicker();
  Future<Either<Failure,Audicker>> getRenamedAudicker();
}