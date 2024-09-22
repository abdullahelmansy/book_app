import 'package:book_app/core/functions/navigation.dart';
import 'package:book_app/feature/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:book_app/feature/home/presentation/bloc/bloc/home_state.dart';
import 'package:book_app/feature/home/presentation/views/book_details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) =>
                  current is GetBestSellerLoadingState ||
                  current is GetBestSellerSuccessState,
              builder: (context, state) {
                if (state is GetBestSellerSuccessState) {
                  var books = context
                      .read<HomeBloc>()
                      .bestSellerResponseModel
                      .data!
                      .products;
                  return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 300,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: books!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            push(
                                context,
                                BookDetailsView(
                                  product: books[index],
                                ));
                          },
                          child: Container(
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
                                  child: Hero(
                                    tag: books[index].id ?? '',
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.error,
                                          color: AppColors.primaryColor,
                                        ),
                                        fit: BoxFit.cover,
                                        imageUrl: '${books[index].image}',
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(5),
                                Text(
                                  books[index].name ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: getTitleTextStyle(
                                    context,
                                    fontSize: 18,
                                  ),
                                ),
                                const Gap(10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '₹${books[index].price}',
                                      style: getBodyTextStyle(context,
                                          fontSize: 16),
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
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      ),
    );
  }
}
