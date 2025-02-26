part of 'banners_loader_bloc.dart';

@freezed
class BannersLoaderState with _$BannersLoaderState {
  const factory BannersLoaderState.initial() = _Initial;
  const factory BannersLoaderState.loadInProgress() = _LoadInProgress;
  const factory BannersLoaderState.loadSuccess(KtList<String> bannerUrls) =
      _LoadSuccess;
  const factory BannersLoaderState.loadFailure(BannerFailure failure) =
      _LoadFailure;
}
