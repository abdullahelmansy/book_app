part of 'checkout_bloc.dart';

sealed class CheckoutEvent {}

class GetCheckoutEvent extends CheckoutEvent {}

class AddToPlaceOrderEvent extends CheckoutEvent {
  final String name;
  final String email;
  final String address;
  final String phone;
  final int governorateId;

  AddToPlaceOrderEvent({required this.name, required this.email, required this.address, required this.phone, required this.governorateId});
}
