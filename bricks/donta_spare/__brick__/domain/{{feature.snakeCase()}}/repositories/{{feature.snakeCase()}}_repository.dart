import 'package:dartz/dartz.dart';

abstract class {{ feature.pascalCase() }}Repository { {{ #usecases }}
  Future<Either<FailureResponse, {{ response.pascalCase() }}Entity>> {{ method }}{{ name.pascalCase() }}({{#isHaveBody}}{{ bodyName.pascalCase() }} body{{ /isHaveBody }});{{ /usecases }}
}

