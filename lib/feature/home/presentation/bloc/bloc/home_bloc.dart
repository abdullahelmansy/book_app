import 'package:book_app/feature/home/data/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:book_app/feature/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetBestSellerEvent>(getBestSeller);
  }
  late BestSellerResponseModel bestSellerResponseModel;
  Future<void> getBestSeller(
      GetBestSellerEvent event, Emitter<HomeState> emit) async {
    emit(GetBestSellerLoadingState());
    await HomeRepo.getBestSeller().then((value) {
      if (value != null) {
        bestSellerResponseModel = value;
        emit(GetBestSellerSuccessState());
      } else {
        emit(ErrorState('Get Best Seller Failed'));
      }
    });
  }
}
