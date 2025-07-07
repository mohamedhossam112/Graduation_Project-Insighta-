import 'package:bloc/bloc.dart';

import 'package:insighta/features/suggest/data/repos/get_books_repo.dart';
import 'package:insighta/features/suggest/logic/get_books_cubit/get_books_state.dart';

class GetBooksCubit extends Cubit<GetBooksState> {
  final GetBooksRepo _getBooksRepo;
  GetBooksCubit(this._getBooksRepo) : super(GetBooksState.initial());
  void getBooks() async {
    emit(const GetBooksState.loading());
    final response = await _getBooksRepo.getBooks();
    response.when(success: (booksresponse) {
      emit(GetBooksState.success(bookModel: booksresponse));
    }, failure: (error) {
      emit(GetBooksState.error(error: error));
    });
  }
}
