import "../../models/datarecord.dart";

typedef SearchParams = Map<String, dynamic>;

class ListState<T> {
  final bool isFetching;
  final SearchParams searchParams;
  final List<DataRecord<T>> entries;
  final Object? error;

  const ListState(
      {required this.isFetching,
      required this.searchParams,
      required this.entries,
      required this.error});

  factory ListState.initial() {
    return const ListState(
        isFetching: false, searchParams: {}, entries: [], error: null);
  }

  ListState<T> copyWith({
    bool? isFetching,
    SearchParams? searchParams,
    List<DataRecord<T>>? entries,
    Object? error,
  }) {
    return ListState(
        isFetching: isFetching ?? this.isFetching,
        searchParams: searchParams ?? this.searchParams,
        entries: entries ?? this.entries,
        error: error ?? this.error);
  }
}

class FetchRequestAction {
  FetchRequestAction();
}

class FetchSuccessAction<T> {
  final List<DataRecord<T>> entries;
  final SearchParams searchParams;

  FetchSuccessAction({required this.entries, required this.searchParams});
}

class FetchErrorAction {
  final dynamic error;

  FetchErrorAction({required this.error});
}

class ModifyEntry<T> {
  final int id;
  final DataRecord<T> new_value;

  ModifyEntry(this.id, this.new_value);
}
