part of 'user_loader_bloc.dart';

@freezed
sealed class UserLoaderState with _$UserLoaderState {
  const factory UserLoaderState.initial() = Initial;
  const factory UserLoaderState.loadInProgress() = LoadInProgress;
  const factory UserLoaderState.loadFailure(UserFailure failure) = LoadFailure;
  const factory UserLoaderState.loadSuccess(User user) = LoadSuccess;
}
