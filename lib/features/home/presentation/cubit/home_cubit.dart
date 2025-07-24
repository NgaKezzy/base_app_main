import 'package:baseApp/features/home/data/repositories/user_repository_iplm.dart';
import 'package:baseApp/core/no_params/no_params.dart';
import 'package:baseApp/common/loading/loading.dart';
import 'package:baseApp/features/home/domain/usecases/get_all_user_usecase.dart';
import 'package:baseApp/features/home/presentation/cubit/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getAllUserUsecase}) : super(HomeState());
  GetAllUserUsecase getAllUserUsecase;

  Future<void> getUsers() async {
    // Loading.showLoading();
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        emit(state.copyWith(status: HomeStatus.loading));
        final response = await getAllUserUsecase.call(NoParams());
        // Loading.hideLoading();

        response.fold(
          (failure) =>
              emit(state.copyWith(users: [], status: HomeStatus.failure)),
          (users) =>
              emit(state.copyWith(users: users, status: HomeStatus.success)),
        );
      },
    );
  }
}
