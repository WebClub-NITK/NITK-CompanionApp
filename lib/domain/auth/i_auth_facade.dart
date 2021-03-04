import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:utilapp/domain/auth/auth_failure.dart';
import 'package:utilapp/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
