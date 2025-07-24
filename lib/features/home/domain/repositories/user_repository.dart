import 'package:baseApp/features/home/domain/entities/response/user_info.dart';
import 'package:baseApp/core/error/failure.dart';
import 'package:baseApp/core/no_params/no_params.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserInfo>>> getUsers({required NoParams request});
}
