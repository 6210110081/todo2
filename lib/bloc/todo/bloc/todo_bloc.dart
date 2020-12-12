import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(0));

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is IncreseEvent) {
      yield state.copyWith(value: state.value + 1);
    }
  }

  Future<int> fetchInitialValue() async {
    final resp = await http.get('http://localhost:3000/model');
    var json = jsonDecode(resp.body);
    return json['value'] as int;
  }
}
