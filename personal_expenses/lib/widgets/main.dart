import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shows', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Cyberpunk 2077', amount: 89.99, date: DateTime.now()),
    Transaction(id: 't3', title: 'Valhalla', amount: 30, date: DateTime.now())
  ];

  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return scaffoldWidget(Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          color: Colors.blueAccent,
          child: Container(
            child: Text("CHART!"),
            width: double.infinity,
          ),
          elevation: 5,
        ),
        Card(
          elevation: 5,
          child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "asd"),
                    onChanged: (value) {
                      titleInput = value;
                    },
                  ),
                  TextField(
                    onChanged: (value) {
                      amountInput = value;
                    },
                  ),
                  FlatButton(
                    child: Text("Add Transaction"),
                    color: Colors.purple,
                    textColor: Colors.white,
                    onPressed: () => {print(titleInput)},
                  )
                ],
              )),
        ),
        Column(
            children: transactions.map((transaction) {
          return Card(
              child: Row(
            children: [
              Container(
                child: Text(
                  '\$${transaction.amount.toString()}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple),
                ),
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.purple,
                  width: 2,
                )),
                padding: EdgeInsets.all(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(DateFormat('dd/MM/yyyy').format(transaction.date))
                ],
              )
            ],
          ));
        }).toList())
      ],
    ));
  }

  Widget scaffoldWidget(Widget body) {
    return Platform.isIOS
        ? CupertinoApp(
            home: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text("Flutter App"),
            ),
            child: body,
          ))
        : MaterialApp(
            home: Scaffold(
            appBar: AppBar(
              title: Text("Flutter App"),
            ),
            body: body,
          ));
  }
}
