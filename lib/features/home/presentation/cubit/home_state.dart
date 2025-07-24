import 'package:baseApp/features/home/domain/entities/response/user_info.dart';
import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';


part 'home_state.g.dart';
enum HomeStatus { initial, loading, success, failure }

@CopyWith()
class HomeState extends Equatable {
  const HomeState({this.users = const [], this.status = HomeStatus.initial});
  final List<UserInfo> users;
  final HomeStatus status ;

  @override
  List<Object> get props => [users, status];
}
