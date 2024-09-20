import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widgets/custom_button.dart';

class PopularBookWidget extends StatelessWidget {
  const PopularBookWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Books',
            style: getTitleTextStyle(context),
          ),
          const Gap(15),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 300,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  // margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/image/book.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Gap(5),
                      Text(
                        'The Republic',
                        style: getTitleTextStyle(
                          context,
                          fontSize: 18,
                        ),
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹285',
                            style: getTitleTextStyle(context, fontSize: 16),
                          ),
                          CustomButton(
                            color: Colors.black,
                            width: 72,
                            height: 28,
                            text: 'Buy',
                            textStyle: getSmallTextStyle(
                              context,
                              color: AppColors.whiteColor,
                            ),
                            onTap: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
