import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);

    if (title.isNotEmpty && amount > 0) {
      widget.addNewTransaction(
          titleController.text, double.parse(amountController.text));
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "title"),
                controller: titleController,
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: "amount"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitData(),
              ),
              FlatButton(
                child: Text("Add Transaction"),
                color: Colors.purple,
                textColor: Colors.white,
                onPressed: () => {submitData()},
              )
            ],
          )),
    );
  }
}
