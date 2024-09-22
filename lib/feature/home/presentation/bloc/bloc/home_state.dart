class HomeState {}

class HomeInitial extends HomeState {}
//bset seller
class GetBestSellerLoadingState extends HomeState {}

class GetBestSellerSuccessState extends HomeState {}
//get slider
class GetSliderLoadingState extends HomeState {}

class GetSliderSuccessState extends HomeState {}

//error state
class ErrorState extends HomeState {
  final String error;
  ErrorState(this.error);
}
