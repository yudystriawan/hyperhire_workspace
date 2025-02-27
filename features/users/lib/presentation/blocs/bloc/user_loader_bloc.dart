import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:users/users.dart';

part 'user_loader_bloc.freezed.dart';
part 'user_loader_event.dart';
part 'user_loader_state.dart';

@injectable
class UserLoaderBloc extends Bloc<UserLoaderEvent, UserLoaderState> {
  final GetUserDetailUsecase _getUserDetailUsecase;
  UserLoaderBloc(this._getUserDetailUsecase) : super(Initial()) {
    on<_Fetched>(_onFetched);
  }

  Future<void> _onFetched(_Fetched event, Emitter<UserLoaderState> emit) async {
    if (state is LoadInProgress) return;

    emit(LoadInProgress());
    final result = await _getUserDetailUsecase(event.id);
    emit(
      result.fold(
        (failure) => LoadFailure(failure),
        (user) => LoadSuccess(user),
      ),
    );
  }
}
