part of 'user_loader_bloc.dart';

@freezed
sealed class UserLoaderEvent with _$UserLoaderEvent {
  const factory UserLoaderEvent.fetched(String id) = _Fetched;
}
