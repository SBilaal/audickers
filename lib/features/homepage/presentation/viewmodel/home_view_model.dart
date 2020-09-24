import 'package:flutter/cupertino.dart';

import '../../../../core/enums/view_state.dart';
import '../../../../core/services/audio_player.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/services/search.dart';
import '../../../homepage/domain/entities/audicker.dart';
import '../../domain/usecases/audicker_manager.dart';

class HomeViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  Search _search = locator<Search>();
  AudickerManager _audickerManager = locator<AudickerManager>();
  AudioPlayer _player = locator<AudioPlayer>();
  bool _isPlayerInitialized = false;

  ViewState get state {
    return _state;
  }

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  Future<List<Audicker>> searchAudickers(String searchTerm) async {
    setState(ViewState.Busy);
    var result = await _search(searchTerm);
    setState(ViewState.Idle);
    return result;
  }

  Future<List<Audicker>> getRawAudickers() async {
    setState(ViewState.Busy);
    var rawAudickers = await _audickerManager.getRawAudickers();
    setState(ViewState.Idle);
    return rawAudickers;
  }

  Future<List<Audicker>> getRenamedAudickers() async {
    setState(ViewState.Busy);
    var renamedAudickers = await _audickerManager.getRenamedAudickers();
    setState(ViewState.Idle);
    return renamedAudickers;
  }

  Future<Audicker> renameAudicker(Audicker audicker, String name) async {
    return await _audickerManager.rename(audicker, name);
  }

  Future<void> deleteAudicker(Audicker audicker) {
    _audickerManager.delete(audicker);
  }

  Future<void> shareAudicker(Audicker audicker) async {
    await _audickerManager.share(audicker);
  }

  Future<void> playAudicker(Audicker audicker) async {
    if (!_isPlayerInitialized) {
      await _player.init();
    }
    if (_player.isPaused) {
      await _player.resume();
    }
    else {
      await _player.play(audicker.path);
    }
  }

  Future<void> pauseAudicker() async {
    await _player.pause();
  }

  Future<void> seekAudioPosiiton(int milliseconds) async {
    if(_player.isPlaying || _player.isPaused) {
      await _player.seek(milliseconds);
    }
  }

  double get currentAudioPosition {
    return _player.currentPosition ?? 0.0;
  }

  double get maxAudioDuration {
    return _player.maxDuration ?? 0.0;
  }
}
