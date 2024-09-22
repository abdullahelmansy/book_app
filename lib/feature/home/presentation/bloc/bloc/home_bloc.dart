import 'package:book_app/feature/home/data/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:book_app/feature/home/data/model/response/get_sliders/get_sliders.dart';
import 'package:book_app/feature/home/data/model/response/get_wish_list_reponse_model/get_wish_list_reponse_model.dart';
import 'package:book_app/feature/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetBestSellerEvent>(getBestSeller);
    on<GetSlidersEvent>(getSlider);
    on<AddToWishListEvent>(addToWishList);
    on<GetWishListEvent>(getWishList);
    on<RemoveFromWishListEvent>(removeFromWishList);

    
  }
  late BestSellerResponseModel bestSellerResponseModel;
  late GetSlidersResponseModel getSliders;
  late GetWishListResponseModel getWishListResponseModel;
  Future<void> getBestSeller(
      GetBestSellerEvent event, Emitter<HomeState> emit) async {
    emit(GetBestSellerLoadingState());
    await HomeRepo.getBestSeller().then((value) {
      if (value != null) {
        bestSellerResponseModel = value;
        emit(GetBestSellerSuccessState());
      } else {
        emit(ErrorState('Get Slider Failed'));
      }
    });
  }

  Future<void> getSlider(GetSlidersEvent event, Emitter<HomeState> emit) async {
    emit(GetSliderLoadingState());
    await HomeRepo.getSlider().then((value) {
      if (value != null) {
        getSliders = value;
        emit(GetSliderSuccessState());
      } else {
        emit(ErrorState('Get Best Seller Failed'));
      }
    });
  }

  Future<void> addToWishList(
      AddToWishListEvent event, Emitter<HomeState> emit) async {
    emit(AddToWishListLoadingState());
    await HomeRepo.addToWishList(productId: event.productId).then((value) {
      if (value) {
        emit(AddToWishListLoadedState());
      } else {
        emit(ErrorState('error'));
      }
    });
  }

  Future<void> removeFromWishList(
      RemoveFromWishListEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFromWishListLoadingState());
    await HomeRepo.removeFromWishList(productId: event.productId).then((value) {
      if (value) {
        emit(RemoveFromWishListLoadedState());
      } else {
        emit(ErrorState('error'));
      }
    });
  }

  Future<void> getWishList(
      GetWishListEvent event, Emitter<HomeState> emit) async {
    emit(GetWishListLoadingState());
    await HomeRepo.getWishList().then((value) {
      if (value != null) {
        if (value.data!.data!.isEmpty == true) {
          emit(AddToWishListEmptyState());
        }else{
        getWishListResponseModel = value;
        emit(GetWishListLoadedState());}
      } else {
        emit(ErrorState('error to delete in wishlist'));
      }
    });
  }
}
