import 'dart:async';
import 'dart:math';

import 'package:flutter_sound/flutter_sound.dart';

class AudioPlayer {
  FlutterSoundPlayer _player = FlutterSoundPlayer();
  StreamSubscription _playersubscription;
  double currentPosition;
  double maxDuration;

  bool get isPlaying {
    return _player?.isPlaying;
  }

  bool get isPaused {
    return _player?.isPaused;
  }

  bool get isStopped {
    return _player.isStopped;
  }

  _addListeners() {
    _playersubscription = _player.onProgress.listen((playback) {
      if (playback != null) {
        maxDuration = playback.duration.inMilliseconds.toDouble();
        if (maxDuration < 0) maxDuration = 0;

        currentPosition =
            min(playback.position.inMilliseconds.toDouble(), maxDuration);
        if (currentPosition < 0) currentPosition = 0;
      }
    });
  }

  Future<void> _cancelSubscription() async {
    await _playersubscription?.cancel();
    _playersubscription = null;
  }

  Future<void> init() async {
    await _player.openAudioSession();
    await _player.setSubscriptionDuration(Duration(milliseconds: 10));
  }

  Future<void> close() async {
    await _cancelSubscription();
    await _player.closeAudioSession();
  }

  Future<void> play(String audFilePath) async {
    if (_player.isStopped) {
      await _player?.startPlayer(fromURI: audFilePath);
      _addListeners();
    }
  }

  Future<void> pause() async {
    if (_player.isPlaying) await _player.pausePlayer();
  }

  Future<void> resume() async {
    if (_player.isPaused) await _player.pausePlayer();
  }

  Future<void> seek(int milliSeconds) async {
    if (_player.isPlaying || _player.isPaused)
      await _player.seekToPlayer(Duration(milliseconds: milliSeconds));
  }
}
