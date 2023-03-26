import 'package:flutter/material.dart';
import 'package:playground_flutter/uikit/theme/app_colors.dart';

import '../../../core/open_playstore.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 16),
          ItemsCarousel(
            backgroundColor: Colors.transparent,
            imagePath: "assets/images/img_logo_havan.png",
            onClick: () {
              openPlayStoreOrShowToast(
                packageName: "com.artech.eaplic.havan",
              );
            },
          ),
          const SizedBox(width: 16),
          ItemsCarousel(
            backgroundColor: AppColors.yellowRiHappy,
            imagePath: "assets/images/img_logo_rihappy.png",
            onClick: () {
              openPlayStoreOrShowToast(
                packageName: "br.com.rihappy.meusolzinho",
              );
            },
          ),
          const SizedBox(width: 16),
          ItemsCarousel(
            backgroundColor: AppColors.orangeLeve,
            imagePath: "assets/images/img_logo_leve.png",
            onClick: () {
              openPlayStoreOrShowToast(
                packageName: "br.com.levesaude",
              );
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}

class ItemsCarousel extends StatelessWidget {
  final Color backgroundColor;
  final String imagePath;
  final VoidCallback onClick;

  const ItemsCarousel({
    super.key,
    required this.backgroundColor,
    required this.imagePath,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 100,
        width: 130,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
