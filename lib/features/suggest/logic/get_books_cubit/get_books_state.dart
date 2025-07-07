import 'package:insighta/core/networking/api_error_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insighta/features/suggest/data/models/books_model.dart';

part 'get_books_state.freezed.dart';

@freezed
class GetBooksState with _$GetBooksState {
  const factory GetBooksState.initial() = _Initial;
  const factory GetBooksState.loading() = Loading;
  const factory GetBooksState.success({required BooksModel bookModel}) =
      Success;
  const factory GetBooksState.error({required ApiErrorModel error}) = Error;
}
