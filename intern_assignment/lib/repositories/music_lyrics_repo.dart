
import 'dart:async';

import '../key.dart';
import '../model/lyrics.dart';
import '../networking/api.dart';

class MusicLyricsRepository {
  final int trackId;

  MusicLyricsRepository({required this.trackId});

  ApiProvider _provider = ApiProvider();

  Future<MusicLyrics> fetchMusicDetailsData() async {
    final response = await _provider
        .get("track.lyrics.get?track_id=$trackId&apikey=$apikey");
    return MusicLyrics.fromJson(response);
  }
}