import 'hostel_male_user.dart';
import 'package:bloc/bloc.dart';

abstract class SwipeEvent extends Equatable {
  SwipeEvent();

  List<Object> get props => [];
}

class LoadUsers extends SwipeEvent {
  final List<User> users;

  LoadUsers({required this.users});

  @override
  List<Object> get props => [users];
}

class SwipeLeft extends SwipeEvent {
  final User user;

  SwipeLeft({required this.user});

  @override
  List<Object> get props => [user];
}

class SwipeRight extends SwipeEvent {
  final User user;

  SwipeRight({required this.user});

  @override
  List<Object> get props => [user];
}

abstract class SwipeState {
  const SwipeState();

  List<Object> get props => [];
}

class SwipeLoading extends SwipeState {}

class SwipeLoaded extends SwipeState {
  final List<User> users;

  const SwipeLoaded({
    required this.users
  });

  @override
  List<Object> get props => [users];
}

class SwipeError extends SwipeState {}

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading());

  Stream<SwipeState> mapEventToState(
    SwipeEvent event,
  )
  async* {
    if (event is LoadUsers) {
      yield* _mapLoadUsersToState(event);
    }
    if (event is SwipeLeft) {
      yield* _mapSwipeLeftToState(event, state);
    }
    if (event is SwipeRight) {
      yield* _mapSwipeRightToState(event, state);
    }
  }

  Stream<SwipeState> _mapLoadUsersToState(
    LoadUsers event,
  )
  async* {
    yield SwipeLoaded(users: event.users);
  }

  Stream<SwipeState> _mapSwipeLeftToState(
    SwipeLeft event,
    SwipeState state
  )
  async* {
    if (state is SwipeLoaded) {
      try {
        yield SwipeLoaded(users: List.from(state.users)..remove(event.user));
      }
      catch (_) {}
    }
  }

  Stream<SwipeState> _mapSwipeRightToState(
    SwipeRight event,
    SwipeState state
  )
  async* {
    if (state is SwipeLoaded) {
      try {
        yield SwipeLoaded(users: List.from(state.users)..remove(event.user));
      }
      catch (_) {}
    }
  }
}