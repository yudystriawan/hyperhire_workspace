import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviews/presentation/blocs/reviews_loader/reviews_loader_bloc.dart';
import 'package:reviews/reviews.dart';
import 'package:ui/ui.dart';
import 'package:users/presentation/blocs/bloc/user_loader_bloc.dart';
import 'package:users/presentation/widgets/user_profile_widget.dart';

@RoutePage()
class UserDetailPage extends StatelessWidget implements AutoRouteWrapper {
  const UserDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              '랭킹 1위',
              style: TextStyle(fontSize: 10.sp, color: Color(0xff868686)),
            ),
            Text(
              '베스트 리뷰어',
              style: TextStyle(fontSize: 16.sp, color: Color(0xff1D1D1D)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserProfileWidget(),
            SizedBox(height: 14.w),
            ReviewListView(),
          ],
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  getIt<UserLoaderBloc>()..add(UserLoaderEvent.fetched(id)),
        ),
        BlocProvider(
          create:
              (context) =>
                  getIt<ReviewsLoaderBloc>(param1: id)
                    ..add(ReviewsLoaderEvent.fetched()),
        ),
      ],
      child: this,
    );
  }
}
