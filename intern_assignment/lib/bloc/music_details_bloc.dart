import 'dart:async';

import '../model/music_details.dart';
import '../networking/response.dart';
import '../repositories/music_details_repo.dart';

class MusicDetailsBloc {
  late MusicDetailsRepository _musicDetailsRepository;
  late StreamController _musicDetailsController;
  int trackId;
  StreamSink get musicDetailsSink =>
      _musicDetailsController.sink;

  Stream get musicDetailsStream =>
      _musicDetailsController.stream;

  MusicDetailsBloc({required this.trackId}) {
    _musicDetailsController =
    StreamController<Response<MusicDetails>>.broadcast();
    _musicDetailsRepository = MusicDetailsRepository(trackId: trackId);
    //fetchMusicDetails();
  }
  fetchMusicDetails() async {
    musicDetailsSink.add(Response.loading('Loading details.. '));
    try {
      MusicDetails musicDetails =
      await _musicDetailsRepository.fetchMusicDetailsData();
      musicDetailsSink.add(Response.completed(musicDetails));
    } catch (e) {
      musicDetailsSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _musicDetailsController?.close();
  }
}