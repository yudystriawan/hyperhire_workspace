import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/presentation/blocs/bloc/user_loader_bloc.dart';
import 'package:users/presentation/widgets/user_profile_widget.dart';

@RoutePage()
class UserDetailPage extends StatelessWidget implements AutoRouteWrapper {
  const UserDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: UserProfileWidget()));
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<UserLoaderBloc>()..add(UserLoaderEvent.fetched(id)),
      child: this,
    );
  }
}
