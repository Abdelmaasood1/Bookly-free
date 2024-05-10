import 'package:dio/dio.dart' as dio;
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';


abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(dio.DioError dioError){
    switch (dioError.type) {
      case dio.DioErrorType.connectionError:
        return ServerFailure('Connection timeout with ApiServer');

      case dio.DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case dio.DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case dio.DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case dio.DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case dio.DioErrorType.badCertificate:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}