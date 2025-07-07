// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:insighta/features/suggest/logic/get_books_cubit/get_books_cubit.dart';
import 'package:insighta/features/suggest/logic/get_books_cubit/get_books_state.dart';
import 'package:insighta/features/suggest/ui/widgets/featured_list_view_loading.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<GetBooksCubit>().getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBooksCubit, GetBooksState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text("No books loaded yet.")),
          loading: () => const FeaturedListViewLoading(),
          success: (books) {
            final items = books.items ?? [];
            return ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final book = items[index];
                final volumeInfo = book.volumeInfo;

                return GestureDetector(
                  onTap: () {
                    //Navigator.pushNamed(context, Routes.booksDetailsScreen);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: SizedBox(
                      height: 140.h,
                      child: Row(
                        children: [
                          // Book Thumbnail
                          AspectRatio(
                            aspectRatio: 2.5 / 4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                volumeInfo?.imageLinks?.thumbnail ?? '',
                                fit: BoxFit.cover,
                                /*  errorBuilder: (_, __, ___) => Container(
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.book,
                                      color: Colors.grey),
                                ),*/
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          // Book Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  volumeInfo?.title ?? 'No Title',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  volumeInfo?.authors?.join(', ') ??
                                      'Unknown Author',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "${book.saleInfo?.listPrice?.amount?.toStringAsFixed(2) ?? '--'} ${book.saleInfo?.listPrice?.currencyCode ?? ''}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          error: (err) => Center(
            child: Text(
              'Error: ${err.message}',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
