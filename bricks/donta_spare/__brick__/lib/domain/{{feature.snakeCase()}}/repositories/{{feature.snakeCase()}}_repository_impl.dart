import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

const errorMsg = 'Something went wrong';

class {{feature.pascalCase()}}RepositoryImpl implements {{feature.pascalCase()}}Repository {
  {{feature.pascalCase()}}RepositoryImpl(this.remoteDataSource);

  final {{feature.pascalCase()}}RemoteDataSource remoteDataSource;

  {{#usecases}}
  @override
  Future<Either<FailureResponse, {{response.pascalCase()}}Entity>> {{method.camelCase()}}{{ name.pascalCase() }}({{#isHaveBody}}{{bodyName.pascalCase()}} body{{/isHaveBody}}) async {
    try {
      final remote{{name.pascalCase()}} = await remoteDataSource.{{method}}{{name.pascalCase()}}({{#isHaveBody}}body{{/isHaveBody}});
      return Right(remote{{name.pascalCase()}});
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(
          FailureResponse.fromJson(e.response!.data as Map<String, dynamic>),
        );
      } else {
        // Something happened in setting up or sending the request
        //that triggered an Error
        log(e.message ?? 'Unknown Error');
        return const Left(FailureResponse(message: errorMsg));
      }
    }
  }
  {{/usecases}}
}
