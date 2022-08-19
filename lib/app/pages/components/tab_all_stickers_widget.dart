import 'package:album2022/app/models/sticker_model.dart';
import 'package:album2022/app/pages/components/sticker_completed_widget.dart';
import 'package:album2022/app/pages/components/sticker_uncompleted_widget.dart';
import 'package:album2022/app/stores/album_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class TabAllStickersWidget extends StatelessWidget {
  TabAllStickersWidget({Key? key}) : super(key: key);

  final AlbumStore _albumStore = Modular.get<AlbumStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 4),
      child: ScopedBuilder<AlbumStore, Exception, List<StickerModel>>(
        store: _albumStore,
        onState: (_, stickers) {
          return GridView.count(
            childAspectRatio: .8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 5,
            children: generateStickers(stickers),
          );
        },
      ),
    );
  }

  List<Widget> generateStickers(List<StickerModel> stickers) {
    return stickers
        .map(
          (sticker) => sticker.completed
              ? StickerCompletedWidget(stickerModel: sticker)
              : StickerUnCompletedWidget(stickerModel: sticker),
        )
        .toList();
  }
}
