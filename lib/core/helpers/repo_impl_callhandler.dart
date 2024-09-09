import 'package:dartz/dartz.dart';

import '../errors/api/exceptions/api_exception.dart';

class RepoImplCallHandler<T> {
  RepoImplCallHandler();

  Future<Either<String, T>> call(Future<T> Function() dataSourceCall) async {
    try {
      return Right(await dataSourceCall());
    } on ApiException catch (e) {
      return Left(e.errorModel.message!);
    }
  }
}
