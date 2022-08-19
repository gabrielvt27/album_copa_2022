import 'package:album2022/app/constants.dart';
import 'package:album2022/app/models/sticker_model.dart';
import 'package:album2022/app/services/sticker_service.dart';
import 'package:flutter_triple/flutter_triple.dart';

// ignore: must_be_immutable
class AlbumStore extends NotifierStore<Exception, List<StickerModel>> {
  final StickerService _stickerService;
  List<StickerModel> listStickers = Constants.allStickers;
  String filterActive = "";

  AlbumStore(this._stickerService) : super([]) {
    _fetchStickers();
  }

  _fetchStickers() async {
    listStickers = await _stickerService.getStickersUser();
    update(listStickers);
  }

  _addCompletedSticker(String id) => _stickerService.addCompletedSticker(id);

  _removeCompletedSticker(String id) =>
      _stickerService.removeCompletedSticker(id);

  toogleStickers(String id, bool val) {
    final newStickerList = List<StickerModel>.from(listStickers);
    newStickerList.firstWhere((sticker) => sticker.id == id).completed = val;
    listStickers = newStickerList;

    update(newStickerList);

    (filterActive.isNotEmpty) ? filterStickers(filterActive) : null;

    (val) ? _addCompletedSticker(id) : _removeCompletedSticker(id);
  }

  filterStickers(String txt) {
    filterActive = txt;
    final newStickerList = List<StickerModel>.from(listStickers)
        .where((sticker) => sticker.id.contains(txt.trim().toUpperCase()))
        .toList();
    update(newStickerList);
  }
}
