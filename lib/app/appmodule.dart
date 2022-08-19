import 'package:album2022/app/pages/album_page.dart';
import 'package:album2022/app/pages/login_page.dart';
import 'package:album2022/app/services/auth_service.dart';
import 'package:album2022/app/services/sticker_service.dart';
import 'package:album2022/app/stores/album_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => AuthService()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/login', child: (context, args) => const LoginPage()),
        ModuleRoute('/album', module: AlbumModule()),
      ];
}

class AlbumModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => StickerService()),
        Bind.singleton((i) => AlbumStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AlbumPage()),
      ];
}
