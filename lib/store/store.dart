import '../models/todo.dart';
import '../models/user.dart';
import '../reducers/list_reducer/interfaces.dart';
import '../reducers/list_reducer/reducer.dart';

class AppState {
  final ListState<ToDo> todos;
  // final ListState<User> users;

  AppState({
    required this.todos,
    /*required this.users*/
  });

  factory AppState.initial() {
    return AppState(
      todos: ListState<ToDo>.initial(), /*users: ListState<User>.initial()*/
    );
  }
}

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    todos: listReducer(state.todos, action),
    // users: listReducer(state.users, action)
  );
}
