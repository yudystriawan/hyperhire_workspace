import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';
import 'package:users/presentation/blocs/bloc/user_loader_bloc.dart';
import 'package:users/users.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserLoaderBloc, UserLoaderState>(
      builder: (context, state) {
        return switch (state) {
          Initial() => SizedBox(),
          LoadInProgress() => CircularProgressIndicator(),
          LoadFailure() => Column(
            children: [
              Text('Failed to load user'),
              IconButton(
                onPressed: () => context.read<UserLoaderBloc>(),
                icon: Icon(Icons.refresh),
              ),
            ],
          ),
          LoadSuccess() => Column(
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: 160.w,
                  minWidth: double.infinity,
                ),
                padding: EdgeInsets.all(24.w),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: 120.w,
                      height: 120.w,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: UserProfileImage(
                        url: state.user.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 12.w),
                    Text(state.user.name, style: TextStyle(fontSize: 20.sp)),
                    SizedBox(height: 2.w),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4.w,
                      children: [
                        AppIcon(AppIcons.icCrownGold, size: 15.w),
                        Text(
                          state.user.tier.name,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xffFFD233),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.w),
                    AppChip(label: state.user.description),
                  ],
                ),
              ),
            ],
          ),
        };
      },
    );
  }
}
