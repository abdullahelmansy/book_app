import 'package:book_app/core/utils/colors.dart';
import 'package:book_app/core/utils/text_style.dart';
import 'package:book_app/core/widgets/custom_button.dart';
import 'package:book_app/feature/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:book_app/feature/home/presentation/bloc/bloc/home_event.dart';
import 'package:book_app/feature/home/presentation/bloc/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetWishListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('WishList'),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        if (state is RemoveFromWishListLoadedState) {
          context.read<HomeBloc>().add(GetWishListEvent());
        } else if (state is RemoveFromWishListLoadingState) {}
      }, builder: (context, state) {
        if (state is AddToWishListEmptyState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  size: 100,
                  Icons.not_interested_rounded,
                  color: AppColors.primaryColor,
                ),
                Text(
                  'Empty State',
                  style: getTitleTextStyle(context),
                ),
              ],
            ),
          );
        } else if (state is GetWishListLoadedState) {
          var wishList =
              context.read<HomeBloc>().getWishListResponseModel.data!.data;
          return Padding(
            padding: const EdgeInsets.all(22.0),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          wishList[index].image ?? '',
                          width: 100,
                        ),
                      ),
                      const Gap(20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    wishList[index].name ?? '',
                                    style: getBodyTextStyle(context),
                                  ),
                                ),
                                IconButton.outlined(
                                    constraints: const BoxConstraints(
                                      maxHeight: 20,
                                      maxWidth: 20,
                                    ),
                                    padding: EdgeInsetsDirectional.zero,
                                    iconSize: 18,
                                    onPressed: () {
                                      context.read<HomeBloc>().add(
                                          RemoveFromWishListEvent(
                                              wishList[index].id ?? 0));
                                    },
                                    icon: const Icon(Icons.close)),
                              ],
                            ),
                            Text(
                              wishList[index].price ?? '',
                              style: getBodyTextStyle(context),
                            ),
                            const Gap(20),
                            CustomButton(text: 'Add To Cart', onTap: () {}),
                            const Gap(10)
                          ],
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: wishList!.length),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
