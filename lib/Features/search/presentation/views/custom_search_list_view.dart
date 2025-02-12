import 'package:bookly/Features/home/presentation/views/best_seller_list_view_item.dart';
import 'package:bookly/Features/search/presentation/search_cubit/search_cubit.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/shimmer_row_list_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            itemCount: state.bookslist.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: NewsetBookItem(
                  bookModel: state.bookslist[index],
                ),
              );
            },
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else if (state is SearchLoading) {
          return const ShimmerRowListView();
        } else {
          return const Center(
            child: Text('search for any book',style: Styles.textStyle20,),
          );
        }
      },
    );
  }
}