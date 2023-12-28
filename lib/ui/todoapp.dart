import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoices_app/notifications.dart';
import 'package:invoices_app/ui/downloadbutton.dart';
import 'package:invoices_app/ui/todo/todoentry.dart';
import 'package:invoices_app/ui/todo/todolist.dart';
import '../store/store.dart';
import 'package:redux/redux.dart';
import "../reducers/list_reducer/actions.dart";
import "../models/todo.dart";

class _ToDoAppState extends State<ToDoApp> {
  @override
  void initState() {
    notifyError.registerListener(_notifySnackBar);
    super.initState();
  }

  @override
  void dispose() {
    notifyError.unregisterListener(_notifySnackBar);
    super.dispose();
  }

  _notifySnackBar(event) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(event.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
        builder: (context, store) {
          return MaterialApp(
              title: "ToDo",
              theme: ThemeData.dark(),
              home: Scaffold(
                appBar: AppBar(
                  title: const Text("{JSON} Placeholder"),
                ),
                body: ToDoList(),
                floatingActionButton: DownloadButton(store),
              ));
        },
        converter: (store) => store);
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() {
    return _ToDoAppState();
  }
}
