part of 'banners_loader_bloc.dart';

@freezed
sealed class BannersLoaderState with _$BannersLoaderState {
  const factory BannersLoaderState.initial() = Initial;
  const factory BannersLoaderState.loadInProgress() = LoadInProgress;
  const factory BannersLoaderState.loadSuccess(KtList<String> bannerUrls) =
      LoadSuccess;
  const factory BannersLoaderState.loadFailure(BannerFailure failure) =
      LoadFailure;
}
