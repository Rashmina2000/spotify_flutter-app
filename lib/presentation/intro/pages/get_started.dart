import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.introBackGround),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                Spacer(),
                Text(
                  "Enjoy Listening to Music",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                Text(
                  "Welcome to Spotify! Dive into a world of music, podcasts, and personalized playlists tailored just for you. Discover new artists, explore curated collections, and enjoy seamless streaming anytime, anywhere. Let your musical journey begin!",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ChooseModePage(),
                      ),
                    );
                  },
                  title: "Get Started",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
