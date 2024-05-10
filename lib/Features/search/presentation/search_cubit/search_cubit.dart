import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/Features/search/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> getSearched({required String word}) async {
    emit(SearchLoading());
    var data = await searchRepo.fetchSearchedBooks(word);
    data.fold((failure) {
      emit(SearchFailure(failure.errMessage));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }
}