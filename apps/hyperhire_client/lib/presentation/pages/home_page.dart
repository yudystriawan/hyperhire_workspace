import 'package:auto_route/auto_route.dart';
import 'package:banners/banners.dart';
import 'package:flutter/material.dart';
import 'package:reviews/presentation/widgets/top_products_widget.dart';
import 'package:ui/ui.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LOGO')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerCarousel(),
            SizedBox(height: 12.w),
            TopProductsWidget(),
          ],
        ),
      ),
    );
  }
}
