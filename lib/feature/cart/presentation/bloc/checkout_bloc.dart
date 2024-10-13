import 'package:book_app/feature/cart/data/model/response/checkout_response_model/checkout_response_model.dart';
import 'package:book_app/feature/cart/data/repo/checkout_repo.dart';
import 'package:book_app/feature/home/presentation/bloc/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitial()) {
    on<GetCheckoutEvent>(getCheckout);
  }
  late CheckoutResponseModel checkoutResponseModel;
  Future<void> getCheckout(
      GetCheckoutEvent event, Emitter<CheckoutState> emit) async {
    emit(GetCheckoutLoadingState());
    await CheckoutRepo.checkout().then((value) {
      if (value != null) {
        checkoutResponseModel = value;
        emit(GetCheckoutLoadedState());
      } else {
        emit(ErrorState('Get Slider Failed') as CheckoutState);
      }
    });
  }


  Future<void> getPlaceOrder(
      AddToPlaceOrderEvent event, Emitter<CheckoutState> emit) async {
    emit(PlaceOrderLoadingState());
    await CheckoutRepo.addToPlaceOrder(
            name: event.name,
            email: event.email,
            phone: event.phone,
            address: event.address,
            governorateId: event.governorateId.toString())
        .then((value) {
      if (value) {
        emit(PlaceOrderLoadedState());
      } else {
        emit(ErrorState('Get Slider Failed') as CheckoutState);
      }
    });
  }
}
