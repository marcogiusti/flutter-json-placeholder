import 'package:flutter/material.dart';
import 'package:invoices_app/models/datarecord.dart';
import "../../models/todo.dart";

class ToDoEntry extends StatelessWidget {
  final DataRecord<ToDo> record;
  final void Function(DataRecord<ToDo>) onTap;
  final void Function(DataRecord<ToDo>) onSave;

  ToDoEntry(this.record, this.onTap, this.onSave, {super.key});

  @override
  Widget build(BuildContext context) {
    final entry = record.current;
    TextStyle? style;
    Icon leading;
    IconButton? trailing;

    if (entry.completed) {
      leading = const Icon(Icons.check_box_outlined, color: Colors.green);
      style = const TextStyle(decoration: TextDecoration.lineThrough);
    } else {
      leading = const Icon(Icons.check_box_outline_blank);
    }

    if (record.isModified()) {
      trailing =
          IconButton(onPressed: () => onSave(record), icon: Icon(Icons.upload));
    }

    return Card(
        child: ListTile(
      title: Text(
        entry.title,
        style: style,
      ),
      leading: leading,
      trailing: trailing,
      onTap: () {
        onTap(record);
      },
    ));
  }
}
