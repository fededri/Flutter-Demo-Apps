import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
import 'package:personal_expenses/widgets/user_transaction.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];

  List<Transaction> get _recentTransactions {
    return transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    print(transactions);
    return scaffoldWidget(
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.blueAccent,
              child: Container(
                child: Text("asd"),
                width: double.infinity,
              ),
              elevation: 5,
            ),
            TransactionList(transactions)
          ],
        ),
        context);
  }

  Widget scaffoldWidget(Widget body, BuildContext context) {
    return Platform.isIOS
        ? iosWidget(context, body)
        : MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                textTheme: ThemeData
                    .light()
                    .textTheme
                    .copyWith(
                    headline6: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
            primarySwatch: Colors.purple,
            accentColor: Colors.amber,
            fontFamily: 'Quicksand'),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter App"),
            actions: [
              Builder(
                builder: (ctx) =>
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _startAddNewTransaction(ctx);
                        }),
              )
            ],
          ),
          body: body,
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Builder(
            builder: (ctx) =>
                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    _startAddNewTransaction(ctx);
                  },
                ),
          ),
        ));
  }

  Widget iosWidget(BuildContext context, Widget body) {
    return CupertinoApp(
        title: "Personal expenses",
        home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text("Personal Expenses "),
            trailing: Builder(
              builder: (ctx) =>
                  GestureDetector(
                      child: Icon(CupertinoIcons.add),
                      onTap: () {
                        _startAddNewTransaction(context);
                      }),
            ),
          ),
          child: SafeArea(child: body),
        ));
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(addNewTransaction);
        });
  }

  void addNewTransaction(String title, double amount) {
    final transaction = Transaction(
        id: title, title: title, amount: amount, date: DateTime.now());
    setState(() {
      transactions.add(transaction);
    });
  }
}
