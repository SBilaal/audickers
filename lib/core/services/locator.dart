import 'package:audickers/core/services/audio_player.dart';
import 'package:audickers/core/services/search.dart';
import 'package:audickers/features/homepage/data/repositories/audicker_repository_impl.dart';
import 'package:audickers/features/homepage/domain/usecases/audicker_manager.dart';
import 'package:audickers/features/homepage/presentation/app_theme.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

setup() {
  locator.registerLazySingleton(() => Search());
  locator.registerLazySingleton(() => AudickerManager(AudickerRepositoryImpl()));
  locator.registerLazySingleton(() => AudioPlayer());
  locator.registerLazySingleton(() => AppTheme());
}