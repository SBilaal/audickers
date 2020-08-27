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
    audicker = Audicker(name: "aud", path: "Whatsapp/aud.opus", status: FileStatus.Raw);
  });

  test("should rename the file passed into it", () async {
    var newAudicker = Audicker(name: "Pity Song", path: "${manager.renamedFilesDirectory}/Pity Song.opus", status: FileStatus.Renamed);
    var newName = "Pity Song";
    var renamedAudicker = await manager.rename(audicker, newName);
    expect(renamedAudicker, newAudicker);
  });
}
