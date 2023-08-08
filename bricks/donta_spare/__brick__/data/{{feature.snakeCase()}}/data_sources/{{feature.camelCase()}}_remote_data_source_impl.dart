import 'package:dio/dio.dart';

class {{ feature.pascalCase() }}RemoteDataSourceImpl implements {{ feature.pascalCase() }}RemoteDataSource {
  {{ feature.pascalCase() }}RemoteDataSourceImpl(this._client);

  final Dio _client;
  {{ #usecases }}
  @override
  Future<{{ response.pascalCase() }}Entity> {{ method }}{{ name.pascalCase() }}({{ #isHaveBody }}{{ bodyName.pascalCase() }} body{{ /isHaveBody }}) async {
    try {
      final response = await _client.{{ method.snakeCase() }}<Map<String, dynamic>>(
        'url', {{ #isHaveBody }}
        // TODO Add body {{ /isHaveBody }}
      );
      return {{ response.pascalCase() }}Model.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    } catch(e) {
      throw ServerException();
    }
  }
  {{ /usecases }}
}