import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onDelete,
  }) : super(key: key);

  final Transaction tr;
  final void Function(String p1) onDelete;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.grey,
  ];

  Color? background;
  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(5);
    background = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: background,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('R\$${widget.tr.value}'),
            ),
          ),
        ),
        title: Text(widget.tr.title),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 500
            ? FlatButton.icon(
                onPressed: () {
                  widget.onDelete(widget.tr.id);
                },
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                onPressed: () {
                  widget.onDelete(widget.tr.id);
                },
                color: Theme.of(context).errorColor,
                icon: const Icon(Icons.delete),
              ),
      ),
    );
  }
}
