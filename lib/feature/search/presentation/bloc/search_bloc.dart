import 'package:book_app/feature/home/data/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:book_app/feature/search/data/repo/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<GetSearchEvent>(getSearch);
  }
  BestSellerResponseModel? searchModel;
  TextEditingController searchController = TextEditingController();
  Future<void> getSearch(
      GetSearchEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    await SearchRepo.getSearch(name: event.name).then((value) {
      searchModel = value;
      emit(SearchLoaded());
    });
  }
}
