import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:module_core/helpers/zap_dio_helper.dart';
import 'package:module_core/models/auth/forgot_password/forgot_password_request_model.dart';
import 'package:module_core/models/auth/sign_in/sign_in_request_model.dart';
import 'package:module_core/models/auth/sign_up/sign_up_request_model.dart';
import 'package:module_core/repository/auth/interface/auth_interface.dart';

class AuthRepository implements IAuthRepository {
  final auth = FirebaseAuth.instance;

  @override
  Future<Either<FirebaseAuthException, void>> signIn(SignInRequestModel signInRequestModel) async {
    return executeWithCatch<void>(() async {
      await auth.signOut();
      await auth.signInWithEmailAndPassword(password: signInRequestModel.password, email: signInRequestModel.email);
    });
  }

  @override
  Future<Either<FirebaseAuthException, void>> signUp(SignUpRequestModel signInRequestModel) async {
    return executeWithCatch<void>(() async {
      auth.createUserWithEmailAndPassword(password: signInRequestModel.password, email: signInRequestModel.email);
    });
  }

  @override
  Future<Either<FirebaseAuthException, void>> forgotPasswordRequestModel(
      ForgotPasswordRequestModel forgotPasswordRequestModel) async {
    return executeWithCatch<void>(() async {
      await auth.sendPasswordResetEmail(email: forgotPasswordRequestModel.email);
    });
  }
}
