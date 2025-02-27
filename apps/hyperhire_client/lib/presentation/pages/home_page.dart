import 'package:auto_route/auto_route.dart';
import 'package:banners/banners.dart';
import 'package:flutter/material.dart';
import 'package:products/presentation/widgets/product_image_widget.dart';

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
            ProductImageWidget(url: 'img_product_1.png'),
          ],
        ),
      ),
    );
  }
}
