import 'package:book_app/core/utils/colors.dart';
import 'package:book_app/core/utils/text_style.dart';
import 'package:book_app/core/widgets/custom_button.dart';
import 'package:book_app/feature/search/presentation/bloc/search_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              // var searchBook =
              //     context.read<SearchBloc>().searchModel?.data?.products;
              return Column(
                children: [
                  const Gap(25),
                  TextFormField(
                    controller: context.read<SearchBloc>().searchController,
                    decoration: InputDecoration(
                        hintText: 'Search',
                        suffixIcon: IconButton(
                            onPressed: () {
                              context.read<SearchBloc>().add(GetSearchEvent(
                                  name: context
                                      .read<SearchBloc>()
                                      .searchController
                                      .text));
                            },
                            icon: const Icon(Icons.search_outlined))),
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 300,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: context
                                .read<SearchBloc>()
                                .searchModel
                                ?.data
                                ?.products
                                ?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // push(
                              //     context,
                              //     BookDetailsView(
                              //       product: books[index],
                              //     ));
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        errorWidget: (context, url, error) =>
                                            const Center(
                                          child: Icon(
                                            Icons.error,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        fit: BoxFit.cover,
                                        imageUrl: context
                                                .read<SearchBloc>()
                                                .searchModel
                                                ?.data!
                                                .products?[index]
                                                .image ??
                                            '',
                                      ),
                                    ),
                                  ),
                                  const Gap(5),
                                  Text(
                                    context
                                            .read<SearchBloc>()
                                            .searchModel
                                            ?.data
                                            ?.products?[index]
                                            .name ??
                                        '',
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
                                        '₹${context.read<SearchBloc>().searchModel?.data?.products?[index].price}',
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
                        }),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
