part of 'banners_loader_bloc.dart';

@freezed
class BannersLoaderEvent with _$BannersLoaderEvent {
  const factory BannersLoaderEvent.fetched() = _Fetched;
}
