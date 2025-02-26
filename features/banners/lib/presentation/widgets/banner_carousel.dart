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
        width: 360.w,
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
  __CarouselWidgetState createState() => __CarouselWidgetState();
}

class __CarouselWidgetState extends State<_CarouselWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SizedBox(
        width: 360.w,
        height: 221.w,
        child: PageView.builder(
          itemCount: widget.urls.length,
          itemBuilder: (context, index) {
            return Image.asset(widget.urls[index], fit: BoxFit.cover);
          },
        ),
      ),
    );
  }
}
