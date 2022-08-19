import 'package:album2022/app/pages/components/app_bar_widget.dart';
import 'package:album2022/app/pages/components/progress_bar_widget.dart';
import 'package:album2022/app/pages/components/tab_all_stickers_widget.dart';
import 'package:album2022/app/pages/components/tab_uncompleted_stickers.dart';
import 'package:flutter/material.dart';

import 'package:album2022/app/pages/components/drawer_widget.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: AppBarWidget(),
          ),
          drawer: DrawerWidget(),
          body: TabBarView(
            children: [
              TabAllStickersWidget(),
              TabUncompletedStickersWidget(),
            ],
          ),
          bottomNavigationBar: ProgressBarWidget(),
        ),
      ),
    );
  }
}
