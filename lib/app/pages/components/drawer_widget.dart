import 'package:album2022/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:album2022/app/services/auth_service.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);

  final UserModel _userModel = Modular.get<AuthService>().userModel!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Colors.white,
      width: size.width * .6,
      child: Column(
        children: [
          Container(
            color: const Color(0xFF861436),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(_userModel.photo!),
                  backgroundColor: Colors.transparent,
                ),
                const Spacer(),
                Text(
                  _userModel.name!,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          Divider(color: const Color(0xFF861436).withOpacity(.3)),
          Container(
            padding: const EdgeInsets.only(right: 8, left: 8, bottom: 12),
            width: double.infinity,
            child: InkWell(
              onTap: () => Modular.get<AuthService>().signOut(),
              child: Row(
                children: const [
                  Icon(
                    Icons.power_settings_new_rounded,
                    color: Color(0xFF861436),
                    size: 30,
                  ),
                  Spacer(),
                  Text(
                    "Sair",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF861436),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
