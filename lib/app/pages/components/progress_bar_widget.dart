import 'package:album2022/app/models/sticker_model.dart';
import 'package:album2022/app/pages/components/progress_bar_info_widget.dart';
import 'package:album2022/app/stores/album_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ProgressBarWidget extends StatelessWidget {
  ProgressBarWidget({
    Key? key,
  }) : super(key: key);

  final AlbumStore _albumStore = Modular.get<AlbumStore>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomAppBar(
      elevation: 0,
      color: const Color(0xFF861436),
      child: SizedBox(
        height: size.height * .1,
        child: ScopedBuilder<AlbumStore, Exception, List<StickerModel>>(
          store: _albumStore,
          onState: (_, stickers) => buildProgressBar(_albumStore.listStickers),
        ),
      ),
    );
  }

  Widget buildProgressBar(List<StickerModel> stickers) {
    final numStickers = stickers.length;
    final numStickersCompleted =
        stickers.where((sticker) => sticker.completed).toList().length;
    final numStickersUnCompleted =
        stickers.where((sticker) => !sticker.completed).toList().length;

    final progress = num.parse(
        ((numStickersCompleted / numStickers) * 100).toStringAsFixed(1));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Spacer(),
              ProgressBarInfoWidget(
                info: "$progress%".replaceAll('.', ','),
                title: "Completo",
              ),
              const Spacer(),
              ProgressBarInfoWidget(
                info: "$numStickersCompleted",
                title: "Tenho",
              ),
              const Spacer(),
              ProgressBarInfoWidget(
                info: "$numStickersUnCompleted",
                title: "Faltam",
              ),
              const Spacer(),
            ],
          ),
          Stack(
            children: [
              Container(
                height: 5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 95, 14, 38),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  height: 5,
                  width: constraints.maxWidth * (progress / 100),
                  decoration: BoxDecoration(
                    color: const Color(0xFF21CCB0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
