import 'package:insighta/core/networking/api_error_handler.dart';
import 'package:insighta/core/networking/api_result.dart';

import 'package:insighta/core/networking/books_api_service.dart';

import 'package:insighta/features/suggest/data/models/books_model.dart';

class GetBooksRepo {
  final BooksApiService _booksApiService;

  GetBooksRepo(this._booksApiService);

  Future<ApiResult<BooksModel>> getBooks() async {
    try {
      final response = await _booksApiService.getBooks(
          apiKey: 'AIzaSyCOTwmuMypDzOwu9H2gFElam6eoD57oTwo');

      return ApiResult.success(response);
    } catch (errMessage) {
      return ApiResult.failure(ApiErrorHandler.handle(errMessage));
    }
  }
}
