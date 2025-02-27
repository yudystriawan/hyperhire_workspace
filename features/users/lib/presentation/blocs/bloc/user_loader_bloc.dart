import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users/users.dart';

part 'user_loader_bloc.freezed.dart';
part 'user_loader_event.dart';
part 'user_loader_state.dart';

class UserLoaderBloc extends Bloc<UserLoaderEvent, UserLoaderState> {
  UserLoaderBloc() : super(Initial()) {
    on<UserLoaderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
