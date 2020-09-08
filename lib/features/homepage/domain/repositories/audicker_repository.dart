import 'package:audickers/features/homepage/domain/entities/audicker.dart';

abstract class AudickerRepository {
  Future<List<Audicker>> getRawAudickers();
  Future<List<Audicker>> getRenamedAudickers();
}