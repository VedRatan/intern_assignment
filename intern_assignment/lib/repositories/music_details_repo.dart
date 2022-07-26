
import 'dart:async';

import '../key.dart';
import '../model/music_details.dart';
import '../networking/api.dart';

class MusicDetailsRepository {
  final int trackId;
  MusicDetailsRepository({required this.trackId});
  ApiProvider _provider = ApiProvider();
  Future<MusicDetails> fetchMusicDetailsData() async {
    final response =
    await _provider.get("track.get?track_id=$trackId&apikey=$apikey");
    return MusicDetails.fromJson(response);
  }
}