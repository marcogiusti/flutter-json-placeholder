import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invoices_app/models/todo.dart';
import 'package:invoices_app/reducers/list_reducer/actions.dart';
import 'package:invoices_app/store/store.dart';
import 'package:redux/redux.dart';

class DownloadButton extends StatelessWidget {
  final Store<AppState> store;

  DownloadButton(this.store, {super.key});

  @override
  Widget build(BuildContext context) {
    FloatingActionButton floatingActionButton;

    if (store.state.todos.isFetching) {
      floatingActionButton = FloatingActionButton(
        onPressed: null,
        tooltip: "Downloading...",
        child: const Icon(Icons.downloading),
      );
    } else {
      floatingActionButton = FloatingActionButton(
        onPressed: () {
          bool isModified =
              store.state.todos.entries.any((entry) => entry.isModified());
          Uri url = Uri.https("jsonplaceholder.typicode.com", "todos");

          if (isModified) {
            var dialog = AlertDialog(
              title: Text("Unsaved changes"),
              content: Text(
                  "You have unsaved changes. Do you want to discard them and download the data anyway?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      store.dispatch(fetch(url, ToDo.fromJson));
                    },
                    child: Text("Yes"))
              ],
            );
            showDialog(
                context: context, builder: (BuildContext context) => dialog);
          } else {
            store.dispatch(fetch(url, ToDo.fromJson));
          }
        },
        tooltip: "Download data",
        child: const Icon(Icons.download),
      );
    }
    return floatingActionButton;
  }
}
