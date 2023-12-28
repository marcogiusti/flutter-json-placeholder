import "./interfaces.dart";

ListState<T> listReducer<T>(ListState<T> state, dynamic action) {
  if (action is FetchRequestAction) {
    return state.copyWith(isFetching: true);
  } else if (action is FetchSuccessAction<T>) {
    return ListState<T>(
        isFetching: false,
        searchParams: action.searchParams,
        entries: action.entries,
        error: null);
  } else if (action is FetchErrorAction) {
    return state.copyWith(isFetching: false, error: action.error);
  } else if (action is ModifyEntry<T>) {
    var index = state.entries.indexWhere((entry) => entry.id == action.id);
    var entries = state.entries;
    entries[index] = action.new_value;
    return state.copyWith(entries: entries);
  } else {
    return state;
  }
}
