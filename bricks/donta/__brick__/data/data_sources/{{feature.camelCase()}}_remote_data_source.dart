
abstract class {{ feature.pascalCase() }}RemoteDataSource { {{ #usecases }}
  Future<{{ response.pascalCase() }}Entity> {{ method }}{{ name.pascalCase() }}({{ #isHaveBody }}{{ bodyName.pascalCase() }} body{{ /isHaveBody }});{{ /usecases }}
}

