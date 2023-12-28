import 'package:redux/redux.dart';

class NamespacedAction {
  final String namespace;
  final dynamic action;

  NamespacedAction(this.namespace, this.action);
}

class GlobalAction {
  final dynamic action;

  GlobalAction(this.action);
}

bool hasNamespace(dynamic action, String namespace) {
  return action is NamespacedAction && action.namespace == namespace;
}

bool isGlobal(dynamic action) {
  return action is GlobalAction;
}

Reducer<State> namespaced<State>(String namespace, Reducer<State> reducer) {
  return (State state, dynamic action) {
    if (isGlobal(action) || hasNamespace(action, namespace)) {
      return reducer(state, action.action);
    } else {
      return state;
    }
  };
}

NamespacedAction namespacedAction(String namespace, dynamic action) {
  return NamespacedAction(namespace, action);
}
