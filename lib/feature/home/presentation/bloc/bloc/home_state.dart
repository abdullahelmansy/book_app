class HomeState {}

class HomeInitial extends HomeState {}

class GetBestSellerLoadingState extends HomeState {}

class GetBestSellerSuccessState extends HomeState {}

//error state
class ErrorState extends HomeState {
  final String error;
  ErrorState(this.error);
}
