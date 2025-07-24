import 'package:baseApp/features/home/domain/entities/response/user_info.dart';
import 'package:baseApp/core/constants/url_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_data_source.g.dart';

@RestApi()
abstract class UserDataSource {
  factory UserDataSource(Dio dio, {required String baseUrl}) = _UserDataSource;

  @GET(UrlConstants.users)
  Future<List<UserInfo>> getUsers();
}
