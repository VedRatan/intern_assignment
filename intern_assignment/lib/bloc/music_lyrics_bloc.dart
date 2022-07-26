import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../model/lyrics.dart';
import '../networking/response.dart';
import '../repositories/music_lyrics_repo.dart';

class MusicLyricsBloc {
  late MusicLyricsRepository _musicLyricsRepository;
  late StreamController _musicLyricsController;
  int trackId;
  StreamSink get musicLyricsSink =>
      _musicLyricsController.sink;

  Stream get musicLyricsStream =>
      _musicLyricsController.stream;

  MusicLyricsBloc({required this.trackId}) {
    _musicLyricsController =
    StreamController<Response<MusicLyrics>>.broadcast();
    _musicLyricsRepository = MusicLyricsRepository(trackId: trackId);
    fetchMusicLyrics();
  }
  fetchMusicLyrics() async {
    musicLyricsSink.add(Response.loading('Loading lyrics'));
    try {
      MusicLyrics musicLyrics =
      await _musicLyricsRepository.fetchMusicDetailsData();
      musicLyricsSink.add(Response.completed(musicLyrics));
    } catch (e) {
      musicLyricsSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _musicLyricsController?.close();
  }
}