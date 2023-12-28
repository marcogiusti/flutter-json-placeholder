import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoices_app/models/datarecord.dart';
import 'package:invoices_app/reducers/list_reducer/interfaces.dart';
import '../../models/todo.dart';
import './todoentry.dart';
import '../../store/store.dart';
import 'package:redux/redux.dart';

typedef ToDoListStore = ({
  List<DataRecord<ToDo>> todos,
  dynamic Function(dynamic) dispatch
});

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        builder: (context, store) {
          if (store.todos.entries.isEmpty) {
            return const Center(child: Text("No entries"));
          } else {
            return ListView(
              children: [
                for (var entry in store.todos.entries)
                  ToDoEntry(entry, (record) {
                    store.dispatch(ModifyEntry<ToDo>(record.id,
                        record.setValue(record.current.toggleComplete())));
                  },
                      (record) => store.dispatch(ModifyEntry<ToDo>(
                          record.id, DataRecord.make(record.current))))
              ],
            );
          }
        },
        converter: (Store<AppState> store) =>
            (todos: store.state.todos, dispatch: store.dispatch));
  }
}
