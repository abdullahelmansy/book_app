import 'package:book_app/core/functions/navigation.dart';
import 'package:book_app/core/utils/colors.dart';
import 'package:book_app/core/utils/text_style.dart';
import 'package:book_app/core/widgets/custom_button.dart';
import 'package:book_app/core/widgets/nav_bar_widget.dart';
import 'package:book_app/feature/cart/data/model/governorates.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.totalPrice});

  final String totalPrice;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  int governorateId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: getTitleTextStyle(context),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomButton(
          text: 'CheckOut',
          onTap: () {},
          textStyle: getTitleTextStyle(
            context,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(

          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: 70,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondaryColor
                  ),
                  child: Row(
                    children: [
                      Text('Total Price: ${widget.totalPrice} EGP',style: getTitleTextStyle(context),),
                    ],
                  ),
                ),
                const Gap(20),
                const Divider(),
                const Gap(20),
                Row(children: [
                  Text('Customer Information',style: getBodyTextStyle(context),),
                ],),
                const Gap(15),
                TextFormField(
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                TextFormField(
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your Phone';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Phone',
                  ),
                ),
                TextFormField(
                  controller: addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your Address';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Address',
                  ),
                ),
                Container(
                  height: 70,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondaryColor,
                  ),
                  child: DropdownButton(
                      dropdownColor: AppColors.secondaryColor,
                      isExpanded: true,
                      value: governorateId,
                      items: getGovernorate()
                          .map(
                            (city) => DropdownMenuItem(
                              value: city.id,
                              child: Text(city.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          governorateId = value as int;
                        });
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showSuccessDialog() {
    showDialog(
        context: context,
        builder: (_) => SimpleDialog(
              alignment: Alignment.center,
              backgroundColor: AppColors.whiteColor,
              contentPadding: const EdgeInsets.all(20),
              children: [
                const Gap(20),
                Image.asset(
                  'assets/image/Sticker.svg',
                  height: 150,
                  width: 150,
                ),
                const Gap(20),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Success',
                        style: getTitleTextStyle(context),
                      ),
                      const Gap(20),
                      Text(
                        'Your order will be delivered soon. \nThank you for choosing our app!',
                        style: getBodyTextStyle(
                          context,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const Gap(30),
                      CustomButton(
                          color: AppColors.textColor,
                          textStyle: getBodyTextStyle(
                            context,
                            color: AppColors.whiteColor,
                          ),
                          text: 'Back To Home',
                          onTap: () {
                            pushAndRemoveUntil(context, const NavBarWidget());
                          })
                    ],
                  ),
                )
              ],
            ));
  }
}
