import 'package:auto_route/auto_route.dart';
import 'package:banners/banners.dart';
import 'package:flutter/material.dart';
import 'package:hyperhire_client/presentation/routes/routes.gr.dart';
import 'package:reviews/reviews.dart';
import 'package:ui/ui.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LOGO')),
      backgroundColor: Color(0xffc8c8c8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerCarousel(),
            TopReviewListView(),
            SizedBox(height: 14.w),
            TopReviewersWidget(
              onUserTapped:
                  (userId) => context.pushRoute(UserDetailRoute(id: userId)),
            ),
          ],
        ),
      ),
    );
  }
}
