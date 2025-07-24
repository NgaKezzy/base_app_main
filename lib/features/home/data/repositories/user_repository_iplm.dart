import 'dart:io';

import 'package:baseApp/features/home/data/datasources/user_data_source.dart';
import 'package:baseApp/features/home/domain/entities/response/user_info.dart';
import 'package:baseApp/core/no_params/no_params.dart';
import 'package:baseApp/core/error/failure.dart';
import 'package:baseApp/features/home/domain/repositories/user_repository.dart';

import 'package:baseApp/core/di/di.dart';
import 'package:baseApp/generated/l10n.dart';
import 'package:baseApp/routers/app_router.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/web.dart';
import 'package:injectable/injectable.dart';
import 'package:baseApp/core/dio/intercepter.dart';
import 'package:flutter/material.dart';
import 'package:baseApp/core/error/dio_error_handler.dart';

@injectable
class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;
  final Logger logger = getIt.get();
  UserRepositoryImpl({required this.userDataSource});

  @override
  Future<Either<Failure, List<UserInfo>>> getUsers(
      {required NoParams request}) async {
    try {
      final response = await userDataSource.getUsers();
      return Right(response);
    } on DioException catch (e) {
      DioErrorHandler.handleError(e);
      return Left(Failure(message: e.toString()));
    } catch (e) {
      logger.e(e);
      return Left(Failure(message: e.toString()));
    }
  }
}
