import 'package:dio/dio.dart';
import 'package:insighta/core/networking/books_api_constants.dart';
import 'package:insighta/features/suggest/data/models/books_model.dart';
import 'package:retrofit/retrofit.dart';
part 'books_api_service.g.dart';

@RestApi(baseUrl: BooksApiConstants.baseUrl)
abstract class BooksApiService {
  factory BooksApiService(Dio dio, {String baseUrl}) = _BooksApiService;

  @GET('volumes')
  Future<BooksModel> getBooks({
    @Query('filter') String filter = 'free-ebooks',
    @Query('q') String query = 'mental',
    @Query('key') String? apiKey,
  });
}
