import 'package:flutter/material.dart';
import 'package:reviews/presentation/widgets/reviewer_list/reviewer_list_view.dart';
import 'package:ui/ui.dart';

class TopReviewersWidget extends StatelessWidget {
  const TopReviewersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 220.w),
      color: Colors.white,
      padding: EdgeInsets.all(16.w).copyWith(top: 28.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '골드 계급 사용자들이예요',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff616161),
                      ),
                    ),
                    Text('베스트 리뷰어 🏆 Top10', style: TextStyle(fontSize: 18.sp)),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
            ],
          ),
          SizedBox(height: 18.w),
          ReviewerListView(),
        ],
      ),
    );
  }
}
