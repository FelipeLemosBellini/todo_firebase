import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:module_core/models/auth/forgot_password/forgot_password_request_model.dart';
import 'package:module_core/models/auth/sign_in/sign_in_request_model.dart';
import 'package:module_core/models/auth/sign_up/sign_up_request_model.dart';

abstract class IAuthRepository {
  Future<Either<FirebaseAuthException, void>> signIn(SignInRequestModel signInRequestModel);

  Future<Either<FirebaseAuthException, void>> signUp(SignUpRequestModel signInRequestModel);

  Future<Either<FirebaseAuthException, void>> forgotPasswordRequestModel(
      ForgotPasswordRequestModel forgotPasswordRequestModel);
}
