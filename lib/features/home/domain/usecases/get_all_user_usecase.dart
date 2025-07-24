import 'package:baseApp/features/home/data/repositories/user_repository_iplm.dart';
import 'package:baseApp/features/home/domain/entities/response/user_info.dart';
import 'package:baseApp/core/error/failure.dart';
import 'package:baseApp/core/no_params/no_params.dart';
import 'package:baseApp/core/usercases/usercase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllUserUsecase extends UseCase<List<UserInfo>, NoParams> {

  UserRepositoryImpl userRepositoryImpl;

  GetAllUserUsecase({required this.userRepositoryImpl});
  @override
  Future<Either<Failure, List<UserInfo>>> call(NoParams params) async {
    return userRepositoryImpl.getUsers(request: params);
  }
}
