class HomeState {}

class HomeInitial extends HomeState {}

//bset seller
class GetBestSellerLoadingState extends HomeState {}

class GetBestSellerSuccessState extends HomeState {}

//get slider
class GetSliderLoadingState extends HomeState {}

class GetSliderSuccessState extends HomeState {}

//wishlist
class AddToWishListLoadingState extends HomeState {}

class AddToWishListEmptyState extends HomeState {}

class AddToWishListLoadedState extends HomeState {}

class RemoveFromWishListLoadingState extends HomeState {}

class RemoveFromWishListLoadedState extends HomeState {}

class GetWishListLoadingState extends HomeState {}

class GetWishListLoadedState extends HomeState {}

//wishlist
class AddToCartLoadingState extends HomeState {}

class GetCartEmptyState extends HomeState {}

class AddToCartLoadedState extends HomeState {}

class UpdateCartLoadedState extends HomeState {}

class UpdateCartLoadingState extends HomeState {}

class RemoveFromCartLoadingState extends HomeState {}

class RemoveFromCartLoadedState extends HomeState {}

class GetCartLoadingState extends HomeState {}

class GetCartLoadedState extends HomeState {}

//error state
class ErrorState extends HomeState {
  final String error;
  ErrorState(this.error);
}
