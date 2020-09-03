import 'package:audickers/core/enums/file_status.dart';
import 'package:audickers/features/homepage/domain/entities/audicker.dart';
import 'package:audickers/features/homepage/domain/repositories/audicker_repository.dart';
import 'package:audickers/features/homepage/domain/usecases/audicker_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAudickerRepository extends Mock implements AudickerRepository {}

void main() {
  AudickerManager manager;
  MockAudickerRepository repository;
  Audicker audicker;

  setUp((){
    repository = MockAudickerRepository();
    manager = AudickerManager(repository);
    audicker = Audicker(name: "aud", path: "Whatsapp/aud.opus", status: FileStatus.Raw, duration: Future.value(Duration.zero));
  });

  test("should rename the file passed into it", () async {
    var newAudicker = Audicker(name: "Pity Song", path: "${manager.renamedFilesDirectory}/Pity Song.opus", status: FileStatus.Renamed, duration: Future.value(Duration.zero));
    var newName = "Pity Song";
    var renamedAudicker = await manager.rename(audicker, newName);
    expect(renamedAudicker, newAudicker);
  });

  test("should get a list of raw audios", () async {
    var audicker1 = Audicker(name: "Audicker1", path: "Whatsapp/Audicker1.opus", status: FileStatus.Raw, duration: Future.value(Duration.zero));
    var audicker2 = Audicker(name: "Audicker2", path: "Whatsapp/Audicker2.opus", status: FileStatus.Raw, duration: Future.value(Duration.zero));
    var listOfAudickers = [audicker1, audicker2]; 

    when(repository.getRawAudickers()).thenAnswer((_) async => listOfAudickers);
    List<Audicker> actualList = await manager.getRawAudickers();

    expect(actualList, listOfAudickers);
  });

  test("should get a list of renamed audios", () async {
    var audicker1 = Audicker(name: "Pity Song", path: "${manager.renamedFilesDirectory}/Pity Song.opus", status: FileStatus.Renamed, duration: Future.value(Duration.zero));
    var audicker2 = Audicker(name: "Lmao", path: "${manager.renamedFilesDirectory}/Lmao.opus", status: FileStatus.Renamed, duration: Future.value(Duration.zero));
    var listOfAudickers = [audicker1, audicker2]; 

    when(repository.getRenamedAudickers()).thenAnswer((_) async => listOfAudickers);
    List<Audicker> actualList = await manager.getRenamedAudickers();

    expect(actualList, listOfAudickers);
  });
}
