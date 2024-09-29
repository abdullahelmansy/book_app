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

//cart
class GetCartEvent extends HomeEvent {}

class AddToCartEvent extends HomeEvent {
  final int productId;

  AddToCartEvent({required this.productId});
}

class UpdateCartEvent extends HomeEvent {
  final int cartItemId;
  final int quantity;

  UpdateCartEvent({required this.cartItemId, required this.quantity});
}

class RemoveFromCartEvent extends HomeEvent {
  final int cartItemId;

  RemoveFromCartEvent(this.cartItemId);
}
