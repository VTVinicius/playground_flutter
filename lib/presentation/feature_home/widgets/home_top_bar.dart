import 'package:flutter/material.dart';

import '../../../uikit/theme/app_colors.dart';
import '../../../uikit/widgets/circular_image.dart';

class TopBarHome extends StatelessWidget {
  const TopBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greenApp,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            offset: const Offset(0, 6),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(height: 64),
        CircularImageWithBorder(
          imagePath: "assets/images/img_vini.png",
          imageSize: 100.0,
          borderWidth: 2.0,
          borderColor: Colors.white,
        ),
        const SizedBox(height: 16),
        const Text("Vinicius Teixeira",
            style: TextStyle(color: Colors.white, fontSize: 24)),
        const SizedBox(height: 4),
        const Text("Desenvolvedor Android",
            style: TextStyle(color: Colors.white, fontSize: 14)),
        const SizedBox(height: 16),
      ]),
    );
  }
}
