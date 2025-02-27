import 'package:flutter/material.dart';
import 'package:reviews/reviews.dart';
import 'package:ui/ui.dart';

class TopProductsWidget extends StatelessWidget {
  const TopProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.w,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [Text('제일 핫한 리뷰를 만나보세요'), Text('리뷰️  랭킹⭐ top 3')],
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
            ],
          ),
          SizedBox(height: 18.w),
          ReviewListView(),
        ],
      ),
    );
  }
}
