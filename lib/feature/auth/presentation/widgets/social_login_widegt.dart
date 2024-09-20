import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialCard(
          onTap: () {},
          image: 'assets/image/facebook_ic.svg',
        ),
        const Gap(8),
        SocialCard(image: 'assets/image/google_ic.svg', onTap: () {}),
        const Gap(8),
        SocialCard(image: 'assets/image/cib_apple.svg', onTap: () {}),
      ],
    );
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    super.key,
    required this.image,
    required this.onTap,
  });
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.accentColor, width: 1),
            borderRadius: BorderRadius.circular(12),
            color: AppColors.whiteColor,
          ),
          child: SvgPicture.asset(image),
        ),
      ),
    );
  }
}
