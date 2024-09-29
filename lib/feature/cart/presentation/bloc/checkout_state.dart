part of 'checkout_bloc.dart';

sealed class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class GetCheckoutLoadingState extends CheckoutState {}

class GetCheckoutLoadedState extends CheckoutState {}
