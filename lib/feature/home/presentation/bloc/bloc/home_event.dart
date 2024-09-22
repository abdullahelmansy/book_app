class HomeEvent {}

class GetBestSellerEvent extends HomeEvent {}

class GetSlidersEvent extends HomeEvent {}

//wishlist
class GetWishListEvent extends HomeEvent {}

class AddToWishListEvent extends HomeEvent {
  final int productId;

  AddToWishListEvent({required this.productId});
}

class RemoveFromWishListEvent extends HomeEvent {
  final int productId;

  RemoveFromWishListEvent(this.productId);
}
