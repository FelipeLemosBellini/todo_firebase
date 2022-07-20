import 'package:firebase_auth/firebase_auth.dart';
import 'package:module_external_dependencies/dartz.dart';

Future<Either<FirebaseAuthException, T>> executeWithCatch<T>(Future Function() func) async {
  try {
    return Right(await func.call());
  } on FirebaseAuthException catch (e) {
    return Left(e);
  }
}
