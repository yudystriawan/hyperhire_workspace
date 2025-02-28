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
      appBar: AppBar(
        title: Image(image: AssetImage(ImageConstant.imgLogo, package: 'ui')),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 86.w,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              color: Colors.white,
              child: Center(
                child: SearchField(controller: TextEditingController()),
              ),
            ),
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
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 64.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.1 * 255).toInt()),
                spreadRadius: 2.w,
                blurRadius: 5,
                offset: Offset(0, -2), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomMenuItem(
                  assetIconPath: AppIcons.icHome,
                  label: '홈',
                  isSelected: true,
                ),
                BottomMenuItem(
                  assetIconPath: AppIcons.icCategory,
                  label: '카테고리',
                ),
                BottomMenuItem(
                  assetIconPath: AppIcons.icCommunity,
                  label: '커뮤니티',
                ),
                BottomMenuItem(assetIconPath: AppIcons.icPage, label: '페이지'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
