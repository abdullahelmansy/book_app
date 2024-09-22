import 'package:book_app/core/utils/colors.dart';
import 'package:book_app/core/widgets/back_button_widget.dart';
import 'package:book_app/feature/home/data/model/response/best_seller_response_model/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/text_style.dart';
import '../../../../core/widgets/custom_button.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.product});
  final Product? product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: Row(
          children: [
            const BackButtonWidegt(),
            const Spacer(),
            SvgPicture.asset('assets/icons/Bookmark.svg'),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹${product!.price}',
              style: getTitleTextStyle(context),
            ),
            CustomButton(
              color: Colors.black,
              width: 200,
              text: 'Buy',
              textStyle: getSmallTextStyle(
                context,
                color: AppColors.whiteColor,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(18),
                Hero(
                  tag: product!.id ?? '',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: AppColors.primaryColor,
                      ),
                      width: 250,
                      fit: BoxFit.cover,
                      imageUrl: '${product?.image}',
                    ),
                  ),
                ),
                const Gap(15),
                Text(
                  product!.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getHeadLineTextStyle(
                    context,
                    fontSize: 18,
                  ),
                ),
                const Gap(15),
                Text(
                  product!.category ?? '',
                  style: getTitleTextStyle(
                    context,
                    color: AppColors.primaryColor,
                    fontSize: 18,
                  ),
                ),
                const Gap(15),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  // product!.description ?? '',
                  textAlign: TextAlign.justify,
                  style: getBodyTextStyle(
                    context,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
