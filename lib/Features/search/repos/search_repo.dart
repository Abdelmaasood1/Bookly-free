import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<BookModel>>> fetchSearchedBooks(String word);
}