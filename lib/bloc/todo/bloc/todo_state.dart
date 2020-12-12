part of 'todo_bloc.dart';

@immutable
class TodoState {
  TodoState(this.value);

  final int value;

  TodoState copyWith({int value}) {
    return TodoState(value ?? this.value);
  }
}
