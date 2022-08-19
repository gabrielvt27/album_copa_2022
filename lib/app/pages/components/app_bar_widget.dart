import 'package:album2022/app/stores/album_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({
    Key? key,
  }) : super(key: key);

  final AlbumStore _albumStore = Modular.get<AlbumStore>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF861436),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      title: Center(
        child: TextField(
          onChanged: (str) => _albumStore.filterStickers(str),
          cursorColor: const Color(0xFF21CCB0),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          decoration: const InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
      bottom: const TabBar(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 4,
            color: Color(0xFF21CCB0),
          ),
        ),
        labelColor: Colors.white,
        labelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.3,
        ),
        tabs: [
          Tab(text: "Todas"),
          Tab(text: "Faltando"),
        ],
      ),
    );
  }
}
