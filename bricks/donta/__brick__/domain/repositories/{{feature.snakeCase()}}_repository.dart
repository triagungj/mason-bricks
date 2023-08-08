import 'package:dartz/dartz.dart';

abstract class {{ feature.pascalCase() }}Repository { {{ #usecases }}
  Future<Either<Failure, {{ response.pascalCase() }}Entity>> {{ method }}{{ name.pascalCase() }}({{#isHaveBody}}{{ bodyName.pascalCase() }} body{{ /isHaveBody }});{{ /usecases }}
}
