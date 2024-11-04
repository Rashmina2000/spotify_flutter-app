import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/root/widgets/news_songs.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../core/configs/assets/app_vectors.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBackButton: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          width: 40,
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _topCard(),
            _tabs(),
            SizedBox(
              height: 260,
              child: TabBarView(
                children: [
                  NewsSongs(),
                  Container(),
                  Container(),
                  Container(),
                ],
                controller: _tabController,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _topCard() {
    return Center(
      child: SizedBox(
        height: 155,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVectors.topCard),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 45),
                child: Image.asset(AppImages.topCardImg),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      indicatorColor: AppColors.primary,
      isScrollable: true,
      tabAlignment: TabAlignment.center,
      dividerHeight: 0,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      padding: EdgeInsets.symmetric(vertical: 36),
      tabs: const [
        Text(
          "News",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        Text(
          "Videos",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        Text(
          "Artists",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        Text(
          "Podcasts",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ],
    );
  }
}
