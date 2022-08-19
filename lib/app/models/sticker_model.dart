class StickerModel {
  String id;
  String name;
  bool completed;

  StickerModel({
    required this.id,
    required this.name,
    this.completed = false,
  });
}
