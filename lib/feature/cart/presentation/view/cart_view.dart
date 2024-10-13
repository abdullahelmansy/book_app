import 'package:book_app/core/functions/navigation.dart';
import 'package:book_app/core/utils/colors.dart';
import 'package:book_app/core/utils/text_style.dart';
import 'package:book_app/core/widgets/custom_button.dart';
import 'package:book_app/feature/cart/presentation/bloc/checkout_bloc.dart';
import 'package:book_app/feature/cart/presentation/view/checkout_view.dart';
import 'package:book_app/feature/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:book_app/feature/home/presentation/bloc/bloc/home_event.dart';
import 'package:book_app/feature/home/presentation/bloc/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Cart'),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        if (state is RemoveFromCartLoadedState ||
            state is UpdateCartLoadedState) {
          // Navigator.pop(context);
          context.read<HomeBloc>().add(GetCartEvent());
        } else if (state is GetCheckoutLoadedState) {
          context.read<CheckoutBloc>().add(GetCheckoutEvent());
        }
      }, builder: (context, state) {
        if (state is GetCartEmptyState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  size: 100,
                  Icons.shopping_cart_outlined,
                  color: AppColors.primaryColor,
                ),
                Text(
                  'Cart is Empty',
                  style: getTitleTextStyle(context),
                ),
              ],
            ),
          );
        } else if (state is GetCartLoadedState) {
          var cartItems =
              context.read<HomeBloc>().getCartResponseModel.data?.cartItems;
          return Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                cartItems[index].itemProductImage ?? '',
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
                                          cartItems[index].itemProductName ??
                                              '',
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
                                                RemoveFromCartEvent(
                                                    cartItems[index].itemId ??
                                                        0));
                                          },
                                          icon: const Icon(Icons.close)),
                                    ],
                                  ),
                                  Text(
                                    '\$${cartItems[index].itemProductPriceAfterDiscount}',
                                    style: getBodyTextStyle(context),
                                  ),
                                  const Gap(20),
                                  Row(
                                    children: [
                                      FloatingActionButton.small(
                                        heroTag:
                                            '${cartItems[index].itemId}add',
                                        onPressed: () {
                                          if ((cartItems[index]
                                                      .itemProductStock ??
                                                  0) >
                                              (cartItems[index].itemQuantity ??
                                                  0)) {
                                            context.read<HomeBloc>().add(
                                                  UpdateCartEvent(
                                                    quantity: (cartItems[index]
                                                                .itemQuantity ??
                                                            0) +
                                                        1,
                                                    cartItemId: cartItems[index]
                                                            .itemId ??
                                                        0,
                                                  ),
                                                );
                                          }
                                        },
                                        elevation: 0,
                                        backgroundColor: AppColors.borderColor,
                                        child: const Icon(Icons.add),
                                      ),
                                      const Gap(10),
                                      Text(
                                        cartItems[index]
                                            .itemQuantity
                                            .toString(),
                                        style: getBodyTextStyle(context),
                                      ),
                                      const Gap(10),
                                      FloatingActionButton.small(
                                        heroTag:
                                            '${cartItems[index].itemId}remove',
                                        onPressed: () {
                                          if ((cartItems[index].itemQuantity ??
                                                  0) >
                                              1) {
                                            context.read<HomeBloc>().add(
                                                  UpdateCartEvent(
                                                    quantity: (cartItems[index]
                                                                .itemQuantity ??
                                                            0) -
                                                        1,
                                                    cartItemId: cartItems[index]
                                                            .itemId ??
                                                        0,
                                                  ),
                                                );
                                          }
                                        },
                                        elevation: 0,
                                        backgroundColor: AppColors.borderColor,
                                        child: const Icon(Icons.remove),
                                      ),
                                      const Gap(10),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: cartItems!.length),
                ),
                Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Text(
                          "Total :",
                          style: getBodyTextStyle(context),
                        ),
                        const Spacer(),
                        Text(
                          "${context.read<HomeBloc>().getCartResponseModel.data!.total}",
                          style: getBodyTextStyle(context),
                        ),
                      ],
                    ),
                    const Gap(10),
                    CustomButton(
                      text: 'Checkout',
                      onTap: () {
                        // if (context
                        //         .read<HomeBloc>()
                        //         .getCartResponseModel
                        //         .data
                        //         ?.total ==
                        //     context
                        //         .read<CheckoutBloc>()
                        //         .checkoutResponseModel
                        //         .data!
                        //         .total) {
                          push(
                              context,
                              CheckoutView(
                                  totalPrice: context
                                          .read<HomeBloc>()
                                          .getCartResponseModel
                                          .data!
                                          .total ??
                                      '0'));
                        }
                      // },
                    ),
                  ],
                ),
              ],
            ),
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
