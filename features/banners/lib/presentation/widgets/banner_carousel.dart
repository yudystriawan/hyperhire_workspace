import 'package:banners/banners.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<BannersLoaderBloc>()..add(BannersLoaderEvent.fetched()),
      child: SizedBox(
        height: 221.w,
        child: BlocBuilder<BannersLoaderBloc, BannersLoaderState>(
          builder: (context, state) {
            return switch (state) {
              Initial() => SizedBox(),
              LoadInProgress() => Center(child: CircularProgressIndicator()),
              LoadFailure() => Column(
                children: [
                  Text('Something went wrong'),
                  IconButton(
                    onPressed: () => BannersLoaderEvent.fetched(),
                    icon: Icon(Icons.refresh_rounded),
                  ),
                ],
              ),
              LoadSuccess() => _CarouselWidget(urls: state.bannerUrls.asList()),
            };
          },
        ),
      ),
    );
  }
}

class _CarouselWidget extends StatefulWidget {
  final List<String> urls;

  const _CarouselWidget({required this.urls});

  @override
  State<_CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<_CarouselWidget>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController;
  late final AnimationController _animationController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
        _currentPage = (_currentPage + 1) % widget.urls.length;
        _pageController
            .animateToPage(
              _currentPage,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            )
            .then((_) {
              _animationController.forward();
            });
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.urls.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Image(
              height: 221.w,
              image: AssetImage(
                'assets/images/${widget.urls[index]}',
                package: 'banners',
              ),
              fit: BoxFit.fitHeight,
            ),
            Positioned(
              bottom: 10.0,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.urls.length,
                  (indicatorIndex) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: _currentPage == indicatorIndex ? 12.w : 4.w,
                    height: _currentPage == indicatorIndex ? 4.w : 4.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      color:
                          _currentPage == indicatorIndex
                              ? Colors.white
                              : Colors.white.withAlpha((0.5 * 255).toInt()),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
