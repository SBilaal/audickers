import 'package:audickers/features/homepage/data/repositories/audicker_repository_impl.dart';
import 'package:audickers/features/homepage/domain/entities/audicker.dart';
import 'package:audickers/features/homepage/domain/repositories/audicker_repository.dart';

class Search {
  AudickerRepository repository = AudickerRepositoryImpl();

  List<Audicker> audickersFound = [];

  Future<List<Audicker>> call(String searchTerm) async {
    audickersFound = [];
    var rawAudickers = await repository.getRawAudickers();
    var namedAudickers = await repository.getRenamedAudickers();


    var temp1 = rawAudickers
        .where((audicker) =>
            audicker.name.toLowerCase().contains(searchTerm.toLowerCase().trim()) ||
            searchTerm.toLowerCase().trim().contains(audicker.name.toLowerCase()))
        .toList();
    var temp2 = namedAudickers
        .where((audicker) =>
            audicker.name.toLowerCase().contains(searchTerm.toLowerCase().trim()) ||
            searchTerm.toLowerCase().trim().contains(audicker.name.toLowerCase()))
        .toList();
    if(temp1.isNotEmpty) audickersFound.addAll(temp1);
    if(temp2.isNotEmpty) audickersFound.addAll(temp2);

    return audickersFound;
  }
}
