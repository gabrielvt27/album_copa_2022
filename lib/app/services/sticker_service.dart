import 'package:album2022/app/constants.dart';
import 'package:album2022/app/models/sticker_model.dart';
import 'package:album2022/app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StickerService {
  final _user = Modular.get<AuthService>().userModel;

  Future<List<StickerModel>> getStickersUser() async {
    final listStickers = List<StickerModel>.from(Constants.allStickers);

    final completedStickers = await FirebaseFirestore.instance
        .collection('completedStickersUser')
        .doc(_user!.uid)
        .collection('completedStickers')
        .get();

    for (var doc in completedStickers.docs) {
      final index = listStickers.indexWhere((element) => element.id == doc.id);
      if (index > -1) {
        listStickers[index].completed = true;
      }
    }

    return listStickers;
  }

  void addCompletedSticker(String id) {
    FirebaseFirestore.instance
        .collection('completedStickersUser')
        .doc(_user!.uid)
        .collection('completedStickers')
        .doc(id)
        .set({});
  }

  void removeCompletedSticker(String id) {
    FirebaseFirestore.instance
        .collection('completedStickersUser')
        .doc(_user!.uid)
        .collection('completedStickers')
        .doc(id)
        .delete();
  }
}
