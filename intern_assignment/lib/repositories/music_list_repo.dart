
import 'dart:async';
import 'package:intern_assignment/key.dart';

import '../model/music_list.dart';
import '../networking/api.dart';

class MusicListRepository {
  ApiProvider _provider = ApiProvider();
  Future<MusicList> fetchMusicListData() async {
    final response = await _provider.get("chart.tracks.get?apikey=$apikey");
    return MusicList.fromJson(response);
  }
}