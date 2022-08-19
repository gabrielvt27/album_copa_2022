import 'package:album2022/app/models/sticker_model.dart';
import 'package:album2022/app/stores/album_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StickerCompletedWidget extends StatelessWidget {
  StickerCompletedWidget({
    Key? key,
    required this.stickerModel,
  }) : super(key: key);

  final StickerModel stickerModel;
  final AlbumStore _albumStore = Modular.get<AlbumStore>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _albumStore.toogleStickers(stickerModel.id, false),
      child: Stack(
        children: [
          RotationTransition(
            turns: const AlwaysStoppedAnimation(5 / 360),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF861436).withOpacity(.5),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(2, 2), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF861436),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              stickerModel.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
