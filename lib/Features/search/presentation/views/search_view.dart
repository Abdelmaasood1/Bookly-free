import 'package:bookly/Features/search/presentation/search_cubit/search_cubit.dart';
import 'package:bookly/Features/search/presentation/views/search_view_body.dart';
import 'package:bookly/Features/search/repos/search_repo_impl.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchCubit(
            //ToDo
            getIt.get<SearchRepoImplementation>()
          ),
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}