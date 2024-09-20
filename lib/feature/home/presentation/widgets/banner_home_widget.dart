import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_style.dart';

class BannerHomeWidget extends StatefulWidget {
  const BannerHomeWidget({
    super.key,
  });

  @override
  State<BannerHomeWidget> createState() => _BannerHomeWidgetState();
}

class _BannerHomeWidgetState extends State<BannerHomeWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: 4,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) => Stack(
            children: [
              Image.asset(
                'assets/image/banner.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Positioned(
                top: 14,
                left: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      style: getSmallTextStyle(context,
                          color: AppColors.whiteColor, fontSize: 14),
                      'Find out the best books to read \nwhen you don’t even know whan\n to read!!!',
                    ),
                    const Gap(3),
                    Container(
                      height: 28,
                      width: 63,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.whiteColor,
                      ),
                      child: Center(
                        child: Text(
                          'Explore',
                          style: getSmallTextStyle(
                            context,
                            fontSize: 10,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          options: CarouselOptions(
            height: 150,
            // aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            // autoPlay: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reson) {
              setState(() {
                currentIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        SmoothPageIndicator(
            controller:
                PageController(initialPage: currentIndex), // PageController
            count: 4,
            effect: const ExpandingDotsEffect(
              activeDotColor: AppColors.primaryColor,
              dotWidth: 7,
              dotHeight: 7,
              expansionFactor: 7,
            ), // your preferred effect
            onDotClicked: (index) {})
      ],
    );
  }
}
