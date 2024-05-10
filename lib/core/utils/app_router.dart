import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/book_details_view.dart';
import 'package:bookly/Features/home/presentation/home_view.dart';
import 'package:bookly/Features/home/presentation/manager/smilar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/Features/splash_view/widgets/on_boarding.dart';
import 'package:bookly/Features/splash_view/widgets/splash_view.dart';

import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kOnBoarding = '/onBoarding';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
       GoRoute(
        path: '/onBoarding',
        builder: (context, state) =>  OnBoardingBody(),
      ),
     
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>() as HomeRepo,
          ),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
    ],
  );
}